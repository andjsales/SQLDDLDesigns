CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    team_id INT REFERENCES teams(team_id)
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    home_team INT REFERENCES teams(team_id),
    away_team INT REFERENCES teams(team_id),
    season_id INT REFERENCES seasons(season_id)
);


CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(player_id),
    game_id INT REFERENCES games(game_id)
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE game_referees (
    game_id INT REFERENCES games(game_id),
    referee_id INT REFERENCES referees(referee_id),
    PRIMARY KEY (game_id, referee_id)
);


CREATE TABLE lineups (
    lineup_id SERIAL PRIMARY KEY,
    game_id INT REFERENCES games(game_id),
    home_team INT REFERENCES teams(team_id),
    away_team INT REFERENCES teams(team_id)
);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start DATE,
    end DATE
);

CREATE TABLE results (
    result_id SERIAL PRIMARY KEY,
    game_id INT REFERENCES games(game_id),
    winning_team INT REFERENCES teams(team_id),
    is_draw BOOLEAN
);
