create table Cinema
(
   cinema_id            int not null auto_increment,
   cinema_nm            varchar(45) not null,
   cinema_ar            varchar(45) not null,
   primary key (cinema_id)
)

create table room
(
   cinema_room_id       int not null auto_increment,
   cinema_id            int not null,
   hall_name            varchar(10) not null,
   seat_layout          varchar(400) not null,
   primary key (cinema_hall_id),
   constraint FK_R_CinemaHall_Cinema foreign key (cinema_id)
      references Cinema (cinema_id) on delete cascade on update cascade
)

create table Status
(
   movie_status_id      int not null auto_increment,
   status_name          varchar(4) not null,
   primary key (movie_status_id)
)
create table MovieType
(
   movie_type_id        int not null auto_increment,
   type_name            varchar(8) not null,
   primary key (movie_type_id)
)
create table Movie
(
   movie_id             int not null auto_increment,
   movie_type_id        int not null,
   movie_status_id      int not null,
   release_date             date not null,
   title                varchar(10) not null,
   rating               decimal(2,1) not null,
   length               int not null,
   poster_large         varchar(128),
)

create table MovieOnShow
(
   movie_on_show_id     int not null auto_increment,
   cinema_hall_id       int not null,
   movie_id             int not null,
   show_date            date not null,
   show_time            time not null,
   lang                 varchar(2) not null,
   price                decimal(4,1) not null,
   primary key (movie_on_show_id),
   constraint FK_R_MovieOnShow_CinemaHall foreign key (cinema_hall_id)
      references CinemaHall (cinema_hall_id) on delete cascade on update cascade,
   constraint FK_R_MovieOnShow_Movie foreign key (movie_id)
      references Movie (movie_id) on delete cascade on update cascade
)
create table MovieStyle
(
   movie_style_id       int not null auto_increment,
   style_name           varchar(2) not null,
   primary key (movie_style_id)
)
create table R_Movie_MovieStyle
(
   movie_id             int not null,
   movie_style_id       int not null,
   primary key (movie_id, movie_style_id),
   constraint FK_R_MovieStyle_Movie foreign key (movie_id)
      references Movie (movie_id) on delete cascade on update cascade,
   constraint FK_R_Movie_MovieStyle foreign key (movie_style_id)
      references MovieStyle (movie_style_id) on delete cascade on update cascade
)
create table User
(
   user_id              int not null auto_increment,
   phone_num            char(11) not null,
   password             char(32) not null,
   remain_purchase      int not null default 99999,
   primary key (user_id)
)
create table Ticket
(
   ticket_id            int not null auto_increment,
   user_id              int not null,
   valid                bool not null default True,
   code                 char(10) not null,
   primary key (ticket_id),
   constraint FK_R_Ticket_User foreign key (user_id)
      references User (user_id) on delete cascade on update cascade
)
create table Seat
(
   seat_id              int not null auto_increment,
   ticket_id            int,
   movie_on_show_id     int not null,
   row                  int not null,
   col                  int not null,
)
