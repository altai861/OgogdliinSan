create table genres (
    genreId int primary key IDENTITY(1, 1),
    genreName nvarchar(50),
)

create table movies (
    movieId int primary key IDENTITY(1,1),
    title nvarchar(50) not null,
    genreId int not NULL,
    genreIdAlt int,
    director nvarchar(50) not null,
    releaseDate DATE not null,
    duration int not null,
    movieDescription nvarchar(100),
    moviePath nvarchar(50),

    foreign key (genreId) REFERENCES genres(genreId), 
    foreign key (genreIdAlt) REFERENCES genres(genreId), 
)

create table theaters (
    theaterId int primary key IDENTITY(1, 1),
    theaterName nvarchar(50) not null,
    theaterLocation nvarchar(50),
    capacity int,
)

create table uzveruud (
    uzverId int primary key IDENTITY(1, 1),
    movieId int not null,
    theaterId int not null,
    startTime DATETIME not null,
    endTime DATETIME not null,
    uzverDate DATE not null,
    price float not null,

    foreign key (movieId) REFERENCES movies(movieId),
    foreign key (theaterId) REFERENCES theaters(theaterId)
)

create table customers (
    customerId int primary key IDENTITY(1, 1),
    username nvarchar(50) not null,
    email nvarchar(50), 
    phonenumber nvarchar(50),
    hayg nvarchar(50),
)

create table tickets (
    ticketId int primary key IDENTITY(1, 1),
    customerId int not null,
    uzverId int not null,
    
    foreign key (customerId) REFERENCES customers(customerId),
    foreign key (uzverId) references uzveruud(uzverId)
)

