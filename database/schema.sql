-- НОРМАЛИЗОВАННАЯ СХЕМА ДО 3NF ДЛЯ SQLITE
-- Приложение: «Флеш-карточки для запоминания»

PRAGMA foreign_keys = ON;

CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE Decks (
    deck_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    user_id INTEGER NOT NULL,
    created_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Cards (
    card_id INTEGER PRIMARY KEY AUTOINCREMENT,
    front_text TEXT NOT NULL,
    back_text TEXT NOT NULL,
    deck_id INTEGER NOT NULL,
    status TEXT DEFAULT 'new' CHECK(status IN ('new', 'learning', 'review', 'known')),
    next_review_at TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (deck_id) REFERENCES Decks(deck_id) ON DELETE CASCADE
);

CREATE TABLE Reviews (
    review_id INTEGER PRIMARY KEY AUTOINCREMENT,
    card_id INTEGER NOT NULL,
    rating TEXT NOT NULL CHECK(rating IN ('again', 'hard', 'good', 'easy')),
    reviewed_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (card_id) REFERENCES Cards(card_id) ON DELETE CASCADE
);

CREATE TABLE Tags (
    tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    color TEXT
);

CREATE TABLE Card_Tags (
    card_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (card_id, tag_id),
    FOREIGN KEY (card_id) REFERENCES Cards(card_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tags(tag_id) ON DELETE CASCADE
);

-- Индексы для оптимизации запросов
CREATE INDEX idx_decks_user_id ON Decks(user_id);
CREATE INDEX idx_cards_deck_id ON Cards(deck_id);
CREATE INDEX idx_cards_status ON Cards(status);
CREATE INDEX idx_cards_next_review_at ON Cards(next_review_at);
CREATE INDEX idx_reviews_card_id ON Reviews(card_id);
CREATE INDEX idx_reviews_reviewed_at ON Reviews(reviewed_at);
