""""
CS5200 TanYParkMLiC Project Code
"""

import pymysql

# user for data visualization bonus point
import pandas as pd
import matplotlib.pyplot as plt

"""
Function name: connect_to_music_db

Prompt user for the local Mysql sever username and password
And connect to music database
"""
def connect_to_music_db ():
    user_name = input("Please enter your local MySQL username: ")
    password = input("Please enter your local MySQL password: ")

    try:
        connection = pymysql.connect(host='localhost' ,
                                     user=user_name ,
                                     password=password ,
                                     database='musify' ,
                                     charset='utf8mb4' ,
                                     cursorclass=pymysql.cursors.DictCursor)
        print("You have successfully connected to the database.")
        return connection

    except pymysql.MySQLError as e:
        print(f"Error connecting to the database: {e}")
        return None

"""
Function Name: login_user

Allow user to login to their own music account
"""
def login_user(connection):
    username = input("Enter your username: ")
    password = input("Enter your password: ")

    with connection.cursor() as cursor:
        sql = "SELECT password FROM users WHERE user_name = %s"
        cursor.execute(sql, (username,))
        result = cursor.fetchone()

        if result and result['password'] == password:
            print("Login successful!")
            return username
        else:
            print("Invalid username or password. Please try again.")
            return False

"""
Function Name: create_account

"C" operation.
Allow user to create new music account. 
"""
def create_account(connection):
    username = input("Choose a username: ")
    password = input("Choose a password: ")

    with connection.cursor() as cursor:
        try:
            cursor.callproc('CreateAccount', [username, password])
            connection.commit()
            print("Account created successfully!")
        except pymysql.MySQLError as e:
            print(f"Error creating account: {e}")
            connection.rollback()

"""
Function Name: Update Password

"U" Operation.
Allow user to update their current password.
"""
def update_password(connection, username):
    new_password = input("Enter your new password: ")
    with connection.cursor() as cursor:
        try:
            cursor.callproc('UpdateUserPassword', [username, new_password])
            connection.commit()
            print("Password updated successfully!")
        except pymysql.MySQLError as e:
            print(f"Error updating password: {e}")
            connection.rollback()

"""
Function Name: fetch_founded_year

Bonus Point attempt - Data Visualization
Get all year for the graph
"""
def fetch_founded_years(connection):
    with connection.cursor() as cursor:
        cursor.callproc('GetFoundedYears')
        return pd.DataFrame(cursor.fetchall())

"""
Function Name: plot_year_distribution

Bonus Point attempt - Data Visualization
Plot the graph of Bands' year.
This graph provide an opportunity for user to understanding of our music database - Band.
"""
def plot_year_distribution(df):
    # Use Pandas to count the frequency of each year
    year_count = df['founded_year'].value_counts().sort_index()

    year_count.plot(kind='bar')
    plt.xlabel('Founded Year')
    plt.ylabel('Number of Bands')
    plt.title('Distribution of Bands Founded by Year')
    plt.show()

"""
Function Name: fetch_album_release_years

Bonus Point attempt - Data Visualization
Get all year for the graph
"""
def fetch_album_release_years(connection):
    with connection.cursor() as cursor:
        cursor.callproc('GetAlbumReleaseYears')
        return pd.DataFrame(cursor.fetchall())

"""
Function Name: plot_album_year_distribution

Bonus Point attempt - Data Visualization
Plot the graph of ablum release year
This graph provide an opportunity for user to understanding of our album in the database
"""
def plot_album_year_distribution(df):
    # Count the frequency of each release year
    year_count = df['release_year'].value_counts().sort_index()

    year_count.plot(kind='bar')
    plt.xlabel('Release Year')
    plt.ylabel('Number of Albums')
    plt.title('Distribution of Albums by Release Year')
    plt.show()


"""
Function Name: show_playlists

Show user their current playlist in the database.
"""
def show_playlists(connection , username):
    with connection.cursor() as cursor:
        cursor.callproc('GetUserPlaylists' , [username])
        playlists = cursor.fetchall()

        # print out all playlists if user have more than one
        if playlists:
            print("\nYour Playlists:")
            for playlist in playlists:
                print(f" - {playlist['playlist_name']}")
        else:
            print("No playlists on file.")

"""
Function Name: show_playlists_and_song

Show user all songs in their playlists.
"""
def show_playlist_and_song(connection, username):
    with connection.cursor() as cursor:
        cursor.callproc('GetUserPlaylistsAndSongs', [username])
        playlist_songs = cursor.fetchall()

        if playlist_songs:
            print("Your current Playlists and Songs:")
            current_playlist = None
            for row in playlist_songs:
                if row['playlist_name'] != current_playlist:
                    if current_playlist is not None:
                        print("\n")
                    current_playlist = row['playlist_name']
                    print(f"Playlist: {current_playlist}\nSongs in the list:")

                print(f" - Song: {row['song_title']}, Album: {row['album_name']}, Band: {row['band_name']}")

            print("\n")
            return True
        else:
            print("No songs in your playlist.")
            return False


"""
Function Name: get_song_details

Show all songs to user.
"""
def get_song_details(connection):
    with connection.cursor() as cursor:
        cursor.callproc('GetSongDetails')
        results = cursor.fetchall()
        for row in results:
            print(f"Song: {row['song_title']}, Album: {row['album_name']}, Band: {row['band_name']}")


"""
Function Name: playlist_menu

The menu provide for user to manage their playlist
This include all CRUD operation.
"""
def playlist_menu(connection, username):
    while True:
        choice = input("1: Create Playlist\n2: Update Playlist Name\n3: Delete Playlist\n"
                       "4: Insert Song into Playlist\n5: Delete Song from Playlist\n"
                       "6: Exit\nChoose an option: ")
        if choice == "1":
            create_playlist(connection, username)
        elif choice == "2":
            update_playlist_name(connection, username)
        elif choice == "3":
            delete_playlist(connection, username)
        elif choice == "4":
            insert_song_into_playlist(connection, username)
        elif choice == "5":
            delete_song_from_playlist(connection, username)
        elif choice == "6":
            break
        else:
            print("Invalid choice. Please try again.")

"""
Function Name: create_playlist

Create a new playlist for user
"""
def create_playlist(connection , username):
    new_playlist_name = input("Enter a name for your new playlist: ")
    with connection.cursor() as cursor:
        try:
            cursor.callproc('CreatePlaylist' , [new_playlist_name , username])
            connection.commit()
            print("Playlist created successfully!")
        except pymysql.MySQLError as e:
            print(f"Error creating playlist: {e}")
            connection.rollback()

"""
Function Name: update_playlist

Update a current playlist's name
"""
def update_playlist_name(connection , username):
    show_playlists(connection , username)
    playlist_name = input("Enter the name of the playlist you want to update: ")
    new_playlist_name = input("Enter a new name for your playlist: ")
    with connection.cursor() as cursor:
        try:
            cursor.callproc('UpdatePlaylistName' , [playlist_name , new_playlist_name , username])
            connection.commit()
            print("Playlist updated successfully!")
        except pymysql.MySQLError as e:
            print(f"Error updating playlist: {e}")
            connection.rollback()


"""
Function Name: delete_playlist

Delete a playlist.
"""
def delete_playlist(connection , username):
    show_playlists(connection , username)
    playlist_name = input("Enter the name of the playlist you want to delete: ")
    with connection.cursor() as cursor:
        try:
            cursor.callproc('DeletePlaylist' , [playlist_name , username])
            connection.commit()
            print("Playlist deleted successfully!")
        except pymysql.MySQLError as e:
            print(f"Error deleting playlist: {e}")
            connection.rollback()

'''
Function Name: insert_song_into_playlist

Insert song in the playlist.
'''
def insert_song_into_playlist(connection, username):
    show_playlist_and_song(connection, username)
    print("Available songs in the database: ")
    get_song_details(connection)
    song_title = input("Enter the song title you want to add: ")
    album_name = input("Enter the album name associate with the song: ")
    band_name = input("Enter the band name associate with the song: ")
    playlist_name = input("Which playlist you want to put it in? Enter your playlist name: ")

    with connection.cursor() as cursor:
        try:
            cursor.callproc('InsertSongIntoPlaylist', [song_title, album_name, band_name, playlist_name, username])
            connection.commit()
            print("Song inserted into playlist successfully!")
        except pymysql.MySQLError as e:
            print(f"Error inserting song into playlist: {e}")
            connection.rollback()

'''
Function Name: delete_song_from_playlist

Delete a song in the playlist.
'''
def delete_song_from_playlist(connection, username):
    if not show_playlist_and_song(connection , username):
        print("No songs available in your playlists to delete.")
        return

    playlist_name = input("Where is the song located? Enter the playlist name: ")
    song_title = input("Enter the song title you want to remove: ")
    album_name = input("Enter the album name associate with the song: ")
    band_name = input("Enter the band name associate with the song: ")
    with connection.cursor() as cursor:
        try:
            cursor.callproc('DeleteSongFromPlaylist', [song_title, album_name, band_name, playlist_name, username])
            connection.commit()
            print("Song deleted from playlist successfully!")
        except pymysql.MySQLError as e:
            print(f"Error deleting song from playlist: {e}")
            connection.rollback()

"""
Function Name: show_all_bands

List all bands to user.
"""
def show_all_bands(connection):
    with connection.cursor() as cursor:
        cursor.callproc('get_all_band_name')
        results = cursor.fetchall()
        if results:
            print("Available Bands:")
            for row in results:
                print(f" - {row['band_name']}")
        else:
            print("No bands available.")

"""
Function Name: show_all_albums

List all albums name to user.
"""
def show_all_albums(connection):
    with connection.cursor() as cursor:
        cursor.callproc('get_all_album_name')
        results = cursor.fetchall()
        if results:
            print("Available Albums:")
            for row in results:
                print(f" - {row['album_name']}")
        else:
            print("No albums available.")

"""
Function Name: show_all_genres

List all genres name to user.
"""
def show_all_genres(connection):
    with connection.cursor() as cursor:
        cursor.callproc('get_all_genre_name')
        results = cursor.fetchall()
        if results:
            print("Available Genres:")
            for row in results:
                print(f" - {row['genre_name']}")
        else:
            print("No genres available.")

"""
Function name: find_songs

Promote user to explore songs in the database
"""
def find_songs(connection):
    while True:
        choice = input("Find songs by: \n1) Band \n2) Album \n3) Genre \n4) Song Name \n5) Exit\nChoose an option: ")

        if choice == "1":
            show_all_bands(connection)
            band_name = input("Enter band name: ")
            with connection.cursor() as cursor:
                cursor.callproc('get_song_by_bands', [band_name])
                results = cursor.fetchall()
                if results:
                    for row in results:
                        print(f"Band: {row['band_name']}, Song: {row['song_title']}")
                else:
                    print("No songs found for this band.")

        elif choice == "2":
            show_all_albums(connection)
            album_name = input("Enter album name: ")
            with connection.cursor() as cursor:
                cursor.callproc('get_song_by_album', [album_name])
                results = cursor.fetchall()
                if results:
                    for row in results:
                        print(f"Album: {row['album_name']}, Song: {row['song_title']}")
                else:
                    print("No songs found in this album.")

        elif choice == "3":
            show_all_genres(connection)
            genre_name = input("Enter genre name: ")
            with connection.cursor() as cursor:
                cursor.callproc('get_song_by_genre', [genre_name])
                results = cursor.fetchall()
                if results:
                    for row in results:
                        print(f"Genre: {row['genre_name']}, Song: {row['song_title']}")
                else:
                    print("No songs found in this genre.")

        elif choice == "4":
            with connection.cursor() as cursor:
                cursor.callproc('get_all_songs')
                results = cursor.fetchall()
                if results:
                    print("Songs:")
                    for row in results:
                        print(f" - {row['song_title']}")
                else:
                    print("No songs found.")

        elif choice == "5":
            break

        else:
            print("Invalid choice. Please try again.")

"""
Function name: albums_with_longest_playtime

Bonus Point attempt: 3-5 interesting queries
view fact 1 - top 5 albums with the longest playtime descending order
"""
def albums_with_longest_playtime(connection):
    with connection.cursor() as cursor:
        cursor.callproc('AlbumWithLongestPlayTime')
        results = cursor.fetchall()
        if results:
            for result in results:
                album_name = result['album_name']
                total_playtime = float(result['total_playtime'])
                print(f"Album: {album_name}, Total Playtime: {total_playtime} seconds")
            print(' ')
        else:
            print("No albums found")
        discover_facts(connection)

"""
Function name: latest_album_for_each_band

Bonus Point attempt: 3-5 interesting queries
view fact 2 - most recent album released by each band
"""
def latest_album_for_each_band(connection):
    with connection.cursor() as cursor:
        cursor.callproc('BandWithLatestAlbum')
        results = cursor.fetchall()
        if results:
            for result in results:
                band_name = result['band_name']
                album_name = result['album_name']
                latest_release_year = result['release_year']
                print(f"Band Name: {band_name}, Album Name: {album_name}, Latest Release Year: {latest_release_year}")
            print(' ')
        else:
            print("No bands exist")
        discover_facts(connection)

"""
Function name: top_genres_by_number_of_songs

Bonus Point attempt: 3-5 interesting queries
view fact 3 - top 5 most popular genres based on the number of songs 
"""
def top_genres_by_number_of_songs(connection):
    with connection.cursor() as cursor:
        cursor.callproc('TopGenresBySongNums')
        results = cursor.fetchall()
        if results:
            for result in results:
                genre_name = result['genre_name']
                num_songs = int(result['num_songs'])
                print(f"Genre: {genre_name}, Number of Songs: {num_songs}")
            print(' ')
        else:
            print("No genres exist")
        discover_facts(connection)
        
"""
Function name: users_with_most_reviews

Bonus Point attempt: 3-5 interesting queries
view fact 4 - top 5 most popular genres based on the number of songs 
"""
def users_with_most_reviews(connection):
    with connection.cursor() as cursor:
        cursor.callproc('UsersWithMostReviews')
        results = cursor.fetchall()

        if results:
            for result in results:
                user_name = result['user_name']
                num_reviews = int(result['num_reviews'])
                print(f"User: {user_name}, Number of Reviews: {num_reviews}")
            print(' ')
        else:
            print("No users exist\n")
        discover_facts(connection)

"""
Function name: discover_facts

Bonus Point attempt: 3-5 interesting queries
view interesting facts about the data
"""
def discover_facts(connection):
    choice = input("1: Top 5 Albums with the Longest Playtime\n"
                   "2: List of Bands with Their Latest Album\n"
                   "3: Top 5 Most Popular Genres by Number of Songs\n"
                   "4: Top 5 Most Active Users by Number of Reviews\n"
                   "5: Go back to the previous screen\n"
                   "Choose an option: ")
    while choice:
        if choice == "1":
            albums_with_longest_playtime(connection)
        elif choice == "2":
            latest_album_for_each_band(connection)
        elif choice == "3":
            top_genres_by_number_of_songs(connection)
        elif choice == "4":
            users_with_most_reviews(connection)
        elif choice == "5":
            print(' ')
            break
        else:
            print("Invalid choice. Please try again.")
        break

"""
Function Name: main_menu

Show user the option after success connect with local database.
This is the main menu in the application.
"""
def main_menu(connection):
    while True:
        choice = input("1: Login to your music account\n"
                       "2: Create New Account\n"
                       "3: Update Your Password\n"
                       "4: Close connection with database\n"
                       "Choose an option: ")
        
        if choice == "1":
            username = login_user(connection)
            if username:
                while True:
                    print("Welcome User! You can: ")
                    sub_choice = input("1: Manage Playlists\n"
                                       "2: Explore Music\n"
                                       "3: View Band Distribution Graph\n"
                                       "4: View Album Release Year Distribution Graph\n"
                                       "5: Discover Interesting Facts\n"
                                       "6: Logout\n"
                                       "Choose an option: ")        
                    if sub_choice == "1":
                        playlist_menu(connection , username)
                    elif sub_choice == "2":
                        find_songs(connection)
                    elif sub_choice == "3":
                        df_years = fetch_founded_years(connection)
                        plot_year_distribution(df_years)
                    elif sub_choice == "4":
                        df_albums = fetch_album_release_years(connection)
                        plot_album_year_distribution(df_albums)
                    elif sub_choice == "5":
                        discover_facts(connection)
                    elif sub_choice == "6":
                        break
                    else:
                        print("Invalid choice. Please try again.")
        elif choice == "2":
            create_account(connection)
        elif choice == "3":
            username = input("Enter your username: ")
            update_password(connection, username)
        elif choice == "4":
            break
        else:
            print("Invalid choice. Please try again.")
            
"""
Function name: main()

This is the entry point of our application
"""
def main():
   
    connection = connect_to_music_db()

    if connection:
        main_menu(connection)
        connection.close()
        print("Connection closed.")
        
if __name__ == '__main__':
    main()
