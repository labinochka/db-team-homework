CREATE TABLE Profession (
  id VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  salary INTEGER CHECK ( 0 <= salary )
);

CREATE TABLE My_Cool_User (
  id SERIAL PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50),
  date_of_birth DATE NOT NULL CHECK (date_of_birth <= CURRENT_DATE),
  profession_id VARCHAR(100),
  nationality VARCHAR(50),
  phone_number VARCHAR(20) UNIQUE,
  email VARCHAR(100) UNIQUE,
  FOREIGN KEY (profession_id) REFERENCES Profession(id)
);