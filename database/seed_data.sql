-- Тестовые данные для приложения «Флеш-карточки»

INSERT INTO Users (username, email) VALUES
('alex_ivanov', 'alex@example.com'),
('maria_petrova', 'maria@example.com');

INSERT INTO Decks (name, description, user_id) VALUES
('Английский', 'Слова и фразы', 1),
('Термины', 'Профессиональные термины', 1),
('История', 'Даты и события', 2);

INSERT INTO Cards (front_text, back_text, deck_id, status) VALUES
('apple', 'яблоко', 1, 'new'),
('book', 'книга', 1, 'learning'),
('API', 'Application Programming Interface', 2, 'review'),
('Битва при Гастингсе', '1066', 3, 'new');

INSERT INTO Reviews (card_id, rating) VALUES
(1, 'good'),
(2, 'hard'),
(3, 'easy');

INSERT INTO Tags (name, color) VALUES
('еда', '#FFA500'),
('технологии', '#007ACC'),
('история', '#8B4513');

INSERT INTO Card_Tags (card_id, tag_id) VALUES
(1, 1),
(3, 2),
(4, 3);
