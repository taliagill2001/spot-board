-- Run this once in Supabase → SQL Editor. Creates the table, opens it to the
-- anon key (anyone with the page link can read + tick), turns on realtime,
-- and seeds the list.

create table if not exists spots (
  id       bigint generated always as identity primary key,
  sort     int  not null,
  state    text not null,
  name     text not null,
  editor   text,
  done     boolean not null default false,
  done_by  text,
  done_at  timestamptz
);

alter table spots enable row level security;
create policy "anyone can read"   on spots for select using (true);
create policy "anyone can update" on spots for update using (true) with check (true);
create policy "anyone can insert" on spots for insert with check (true);
create policy "anyone can delete" on spots for delete using (true);

alter publication supabase_realtime add table spots;

insert into spots (sort, state, name, editor, done) values
  ( 1,'Iowa','Tamara Edits','JR',false),
  ( 2,'Iowa','Tamara/Abe 30','JR',false),
  ( 3,'Iowa','Joe Tremmel','AL',false),
  ( 4,'Iowa','Hair Dresser','JR',false),
  ( 5,'Iowa','Max/Austin','WT',false),
  ( 6,'Iowa','J. Milks','CH',false),
  ( 7,'Iowa','J. Farran','AL',false),
  ( 8,'Iowa','L. Walker','JR/CH',false),
  ( 9,'TX','Anthem 30','CH',false),
  (10,'TX','Gloria + Paulette','CH',false),
  (11,'TX','Angelita/Dora','JR',false),
  (12,'TX','Mayor Mitch','WT',false),
  (13,'TX','Mayor Machop','WT',false),
  (14,'TX','Mitzi','CH',false),
  (15,'TX','Randy','WT',false),
  (16,'TX','Anthem 2.0','CH',false),
  (17,'MS','Murder 30','JR',false),
  (18,'MS','Nurse VA/Vets','CH',false),
  (19,'MS','William W. Costs/VA','CH',false),
  (20,'MS','Football','CH',false),
  (21,'MS','Charlie Hands','CH',false),
  (22,'Kansas','Pastor',null,true),
  (23,'Kansas','GOP 15/30s',null,true),
  (24,'Kansas','Rancher 2:30s','CH',false),
  (25,'Kansas','Pastor Add''l','CH',false),
  (26,'SC','Trump Voter 15','CH',false),
  (27,'SC','Walker Farmer 30','CH',false),
  (28,'SC','Anthem 60','CH',false);
