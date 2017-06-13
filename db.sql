drop table if exists Cinema;

drop table if exists CinemaHall;

drop table if exists Country;

drop table if exists Movie;

drop table if exists MovieOnShow;

drop table if exists MovieStatus;

drop table if exists MovieStyle;

drop table if exists MovieType;

drop table if exists R_Movie_MovieStyle;

drop table if exists Seat;

drop table if exists Ticket;

drop table if exists User;

create table Cinema
(
   cinema_id            int not null auto_increment,
   cinema_name          varchar(30) not null,
   cinema_addr          varchar(50) not null,
   primary key (cinema_id)
)
engine = InnoDB
default character set = utf8;

alter table Cinema;

create table CinemaHall
(
   cinema_hall_id       int not null auto_increment,
   cinema_id            int not null,
   hall_name            varchar(10) not null,
   seat_layout          varchar(400) not null,
   primary key (cinema_hall_id),
   constraint FK_R_CinemaHall_Cinema foreign key (cinema_id)
      references Cinema (cinema_id) on delete cascade on update cascade
)
engine = InnoDB
default character set = utf8;

alter table CinemaHall;

create table Country
(
   country_id           int not null auto_increment,
   country_name         varchar(6) not null,
   primary key (country_id)
)
engine = InnoDB
default character set = utf8;

alter table Country;

create table MovieStatus
(
   movie_status_id      int not null auto_increment,
   status_name          varchar(4) not null,
   primary key (movie_status_id)
)
engine = InnoDB
default character set = utf8;

alter table MovieStatus;

create table MovieType
(
   movie_type_id        int not null auto_increment,
   type_name            varchar(8) not null,
   primary key (movie_type_id)
)
engine = InnoDB
default character set = utf8;

alter table MovieType;

create table Movie
(
   movie_id             int not null auto_increment,
   movie_type_id        int not null,
   country_id           int not null,
   movie_status_id      int not null,
   pub_date             date not null,
   title                varchar(10) not null,
   rating               decimal(2,1) not null,
   length               int not null,
   poster_small         varchar(128),
   poster_large         varchar(128),
   primary key (movie_id),
   constraint FK_R_Movie_Country foreign key (country_id)
      references Country (country_id) on delete cascade on update cascade,
   constraint FK_R_Movie_MovieStatus foreign key (movie_status_id)
      references MovieStatus (movie_status_id) on delete cascade on update cascade,
   constraint FK_R_Movie_MovieType foreign key (movie_type_id)
      references MovieType (movie_type_id) on delete cascade on update cascade
)
engine = InnoDB
default character set = utf8;

alter table Movie;

create index IDX_poster_large on Movie
(
   poster_large
);

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
engine = InnoDB
default character set = utf8;

alter table MovieOnShow;

create unique index IDX_4_attr on MovieOnShow
(
   movie_id,
   show_date,
   cinema_hall_id,
   show_time
);

create table MovieStyle
(
   movie_style_id       int not null auto_increment,
   style_name           varchar(2) not null,
   primary key (movie_style_id)
)
engine = InnoDB
default character set = utf8;

alter table MovieStyle;

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
engine = InnoDB
default character set = utf8;

create table User
(
   user_id              int not null auto_increment,
   phone_num            char(11) not null,
   password             char(32) not null,
   remain_purchase      int not null default 99999,
   primary key (user_id)
)
engine = InnoDB
default character set = utf8;

alter table User comment '用户';

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
engine = InnoDB
default character set = utf8;

alter table Ticket;

create table Seat
(
   seat_id              int not null auto_increment,
   ticket_id            int,
   movie_on_show_id     int not null,
   row                  int not null,
   col                  int not null,
   available            bool not null default True,
   primary key (seat_id),
   constraint FK_R_Seat_Ticket foreign key (ticket_id)
      references Ticket (ticket_id) on delete set null on update cascade,
   constraint FK_R_Seat_MovieOnShow foreign key (movie_on_show_id)
      references MovieOnShow (movie_on_show_id) on delete cascade on update cascade
)
engine = InnoDB
default character set = utf8;

alter table Seat;

create index IDX_id_available on Seat
(
   movie_on_show_id,
   available
);

create unique index IDX_id_row_col on Seat
(
   movie_on_show_id,
   row,
   col
);

create unique index IDX_code on Ticket
(
   code
);

create unique index IDX_phone_num on User
(
   phone_num
);

