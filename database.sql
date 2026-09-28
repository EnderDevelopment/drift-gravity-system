CREATE TABLE IF NOT EXISTS drift_gravity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    gravity_level INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

INSERT INTO drift_gravity (player_id, gravity_level) SELECT identifier, 100 FROM users WHERE identifier NOT IN (SELECT player_id FROM drift_gravity);