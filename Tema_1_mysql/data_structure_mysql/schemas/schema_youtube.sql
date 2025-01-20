CREATE DATABASE youtube;

USE youtube;


-- **********show tables;****************
-- channels
-- comments
-- likes_dislikes
-- playlist_videos
-- playlists
-- subscriptions
-- tags
-- users
-- videos

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(250) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    user_name VARCHAR(15) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('male', 'female', 'other', 'prefer_not_to_say'),
    country VARCHAR(25) NOT NULL,
    postal_code INT(15)
);

CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    size INT NOT NULL,
    file_name VARCHAR(255),
    duration INT NOT NULL,
    thumbnail VARCHAR(255),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    state ENUM('public', 'hidden', 'private') NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE video_tags (
    video_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id) ON DELETE CASCADE
);

-- //each users can create 1 0r more channels.(user_id)
CREATE TABLE channels (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE subscriptions (
    subscriber_id INT NOT NULL,
    channel_id INT NOT NULL,
    subscription_date DATETIME NOT NULL,
    PRIMARY KEY (subscriber_id, channel_id),
    FOREIGN KEY (subscriber_id) REFERENCES users(user_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT NOT NULL,
    user_id INT NOT NULL,
    text_comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (video_id) REFERENCES videos(video_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- //for both videos and comments
CREATE TABLE likes_dislikes (
    entity_type ENUM('video', 'comment'),
    entity_id INT NOT NULL,
    user_id INT NOT NULL,
    choice ENUM('like', 'dislike') NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (entity_type, entity_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- //connected to the user
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('public', 'private') NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE playlist_videos (
    playlist_id INT NOT NULL,
    video_id INT NOT NULL,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(video_id) ON DELETE CASCADE
);
