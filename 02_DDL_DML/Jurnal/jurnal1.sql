SQL> --nama: Felix Erlangga Ananta
SQL> --nim: 103122400038
SQL> CREATE TABLE Film (
  2  id_film INT PRIMARY KEY,
  3  judul VARCHAR(100),
  4  sinopsis TEXT,
  5  tahun INT,
  6  durasi INT );
sinopsis TEXT,
         *
ERROR at line 4:
ORA-00902: invalid datatype 


SQL> CREATE TABLE Film (
  2  id_film INT PRIMARY KEY,
  3  judul VARCHAR(100),
  4  sinopsis VARCHAR(100),
  5  tahun INT,
  6  durasi INT );

Table created.

SQL> desc Film
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_FILM                                   NOT NULL NUMBER(38)
 JUDUL                                              VARCHAR2(100)
 SINOPSIS                                           VARCHAR2(100)
 TAHUN                                              NUMBER(38)
 DURASI                                             NUMBER(38)

SQL> CREATE TABLE Theater (
  2  id_theater INT PRIMARY KEY,
  3  harga INT,
  4  kapasitas INT,
  5  kelas VARCHAR(50) );

Table created.

SQL> desc Theater
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_THEATER                                NOT NULL NUMBER(38)
 HARGA                                              NUMBER(38)
 KAPASITAS                                          NUMBER(38)
 KELAS                                              VARCHAR2(50)

SQL> CREATE TABLE Member (
  2  id_member INT PRIMARY KEY,
  3  nama VARCHAR(100),
  4  no_hp VARCHAR(15),
  5  tgl_lahir DATE,
  6  email VARCHAR(100) );

Table created.

SQL> desc Member
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_MEMBER                                 NOT NULL NUMBER(38)
 NAMA                                               VARCHAR2(100)
 NO_HP                                              VARCHAR2(15)
 TGL_LAHIR                                          DATE
 EMAIL                                              VARCHAR2(100)

SQL> CREATE TABLE Jadwal (
  2  id_jadwal INT PRIMARY KEY,
  3  id_film INT,
  4  id_theater INT,
  5  periode_start DATETIME,
  6  periode_end DATETIME,
  7  FOREIGN KEY (id_film) REFERENCES Film(id_film),
  8  FOREIGN KEY (id_theater) REFERENCES Theater(id_theater) );
periode_start DATETIME,
              *
ERROR at line 5:
ORA-00902: invalid datatype 


SQL> CREATE TABLE Jadwal (
  2  id_jadwal INT PRIMARY KEY,
  3  id_film INT,
  4  id_theater INT,
  5  periode_start DATE,
  6  periode_end DATE,
  7  FOREIGN KEY (id_film) REFERENCES Film(id_film),
  8  FOREIGN KEY (id_theater) REFERENCES Theater(id_theater) );

Table created.

SQL> desc Jadwal
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_JADWAL                                 NOT NULL NUMBER(38)
 ID_FILM                                            NUMBER(38)
 ID_THEATER                                         NUMBER(38)
 PERIODE_START                                      DATE
 PERIODE_END                                        DATE

SQL> CREATE TABLE Inventaris (
  2  id_inventaris INT PRIMARY KEY,
  3  id_theater INT,
  4  nomor_kursi VARCHAR(10),
  5  FOREIGN KEY (id_theater) REFERENCES Theater(id_theater) );

Table created.

SQL> desc Inventaris
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_INVENTARIS                             NOT NULL NUMBER(38)
 ID_THEATER                                         NUMBER(38)
 NOMOR_KURSI                                        VARCHAR2(10)

SQL> CREATE TABLE Transaksi (
  2  kode_pemesanan INT PRIMARY KEY,
  3  id_jadwal INT,
  4  id_member INT,
  5  status VARCHAR(20),
  6  tanggal DATE,
  7  total_harga INT,
  8  FOREIGN KEY (id_jadwal) REFERENCES Jadwal(id_jadwal),
  9  FOREIGN KEY (id_member) REFERENCES Member(id_member) );

Table created.

SQL> desc Transaksi
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 KODE_PEMESANAN                            NOT NULL NUMBER(38)
 ID_JADWAL                                          NUMBER(38)
 ID_MEMBER                                          NUMBER(38)
 STATUS                                             VARCHAR2(20)
 TANGGAL                                            DATE
 TOTAL_HARGA                                        NUMBER(38)

SQL> INSERT INTO Film VALUES (
  2  1,'500 Days of Summer',2009,95),
  3  2,'La La Land',2016,128),
  4  );
1,'500 Days of Summer',2009,95),
                               *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> INSERT INTO Film VALUES (
  2  1,'500 Days of Summer','Film dengan genre Horror Romance',2009,95),
  3  2,'La La Land','Film tentang kisah romansa musikal',2016,128),
  4  3,'Eternal Sunshine of the Spotless Mind','Film romance Sci-Fi',2004,108);
1,'500 Days of Summer','Film dengan genre Horror Romance',2009,95),
                                                                  *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> INSERT INTO Film VALUES (
  2  1,'500 Days of Summer',2009,95);
INSERT INTO Film VALUES (
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> INSERT INTO Film VALUES (
  2  1,'500 Days of Summer','Film dengan genre Horror Romance',2009,95);

1 row created.

SQL> INSERT INTO Film VALUES (
  2  2,'La La Land','Film tentang kisah romansa musikal',2016,128);

1 row created.

SQL> INSERT INTO Film VALUES (
  2  3,'Eternal Sunshine of the Spotless Mind','Film romance Sci-Fi',2004,108);

1 row created.

SQL> desc Film
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_FILM                                   NOT NULL NUMBER(38)
 JUDUL                                              VARCHAR2(100)
 SINOPSIS                                           VARCHAR2(100)
 TAHUN                                              NUMBER(38)
 DURASI                                             NUMBER(38)

SQL> SELECT * FROM Film;

   ID_FILM                                                                      
----------                                                                      
JUDUL                                                                           
--------------------------------------------------------------------------------
SINOPSIS                                                                        
--------------------------------------------------------------------------------
     TAHUN     DURASI                                                           
---------- ----------                                                           
         1                                                                      
500 Days of Summer                                                              
Film dengan genre Horror Romance                                                
      2009         95                                                           
                                                                                

   ID_FILM                                                                      
----------                                                                      
JUDUL                                                                           
--------------------------------------------------------------------------------
SINOPSIS                                                                        
--------------------------------------------------------------------------------
     TAHUN     DURASI                                                           
---------- ----------                                                           
         2                                                                      
La La Land                                                                      
Film tentang kisah romansa musikal                                              
      2016        128                                                           
                                                                                

   ID_FILM                                                                      
----------                                                                      
JUDUL                                                                           
--------------------------------------------------------------------------------
SINOPSIS                                                                        
--------------------------------------------------------------------------------
     TAHUN     DURASI                                                           
---------- ----------                                                           
         3                                                                      
Eternal Sunshine of the Spotless Mind                                           
Film romance Sci-Fi                                                             
      2004        108                                                           
                                                                                

SQL> SET LINESIZE 200
SQL> SELECT * FROM Film;

   ID_FILM JUDUL                                                                                                                                                                                        
---------- ----------------------------------------------------------------------------------------------------                                                                                         
SINOPSIS                                                                                                  TAHUN     DURASI                                                                              
---------------------------------------------------------------------------------------------------- ---------- ----------                                                                              
         1 500 Days of Summer                                                                                                                                                                           
Film dengan genre Horror Romance                                                                           2009         95                                                                              
                                                                                                                                                                                                        
         2 La La Land                                                                                                                                                                                   
Film tentang kisah romansa musikal                                                                         2016        128                                                                              
                                                                                                                                                                                                        
         3 Eternal Sunshine of the Spotless Mind                                                                                                                                                        
Film romance Sci-Fi                                                                                        2004        108                                                                              
                                                                                                                                                                                                        

SQL> SET WRAP OFF
SQL> SELECT * FROM Film;
rows will be truncated

rows will be truncated


   ID_FILM JUDUL                                                                                                SINOPSIS                                                                                
---------- ---------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------
         1 500 Days of Summer                                                                                   Film dengan genre Horror Romance                                                        
         2 La La Land                                                                                           Film tentang kisah romansa musikal                                                      
         3 Eternal Sunshine of the Spotless Mind                                                                Film romance Sci-Fi                                                                     

SQL> SET WRAP ON
SQL> SELECT * FROM Film;

   ID_FILM JUDUL                                                                                                                                                                                        
---------- ----------------------------------------------------------------------------------------------------                                                                                         
SINOPSIS                                                                                                  TAHUN     DURASI                                                                              
---------------------------------------------------------------------------------------------------- ---------- ----------                                                                              
         1 500 Days of Summer                                                                                                                                                                           
Film dengan genre Horror Romance                                                                           2009         95                                                                              
                                                                                                                                                                                                        
         2 La La Land                                                                                                                                                                                   
Film tentang kisah romansa musikal                                                                         2016        128                                                                              
                                                                                                                                                                                                        
         3 Eternal Sunshine of the Spotless Mind                                                                                                                                                        
Film romance Sci-Fi                                                                                        2004        108                                                                              
                                                                                                                                                                                                        

SQL> INSERT INTO Theater VALUES (
  2  1,50000,100,'VIP');

1 row created.

SQL> INSERT INTO Theater VALUES (
  2  2,45000,120,'Regular');

1 row created.

SQL> INSERT INTO Theater VALUES (
  2  3,75000,80,'Premiere');

1 row created.

SQL> SELECT * FROM Theater;

ID_THEATER      HARGA  KAPASITAS KELAS                                                                                                                                                                  
---------- ---------- ---------- --------------------------------------------------                                                                                                                     
         1      50000        100 VIP                                                                                                                                                                    
         2      45000        120 Regular                                                                                                                                                                
         3      75000         80 Premiere                                                                                                                                                               

SQL> INSERT INTO Member VALUES (
  2  1,'Carl Jhonson','08123456789','1968-08-11','cj@sanandreas.com');
1,'Carl Jhonson','08123456789','1968-08-11','cj@sanandreas.com')
                               *
ERROR at line 2:
ORA-01861: literal does not match format string 


SQL> INSERT INTO Member VALUES (
  2  1,'Carl Jhonson','08123456789',1968-08-11,'cj@sanandreas.com');
1,'Carl Jhonson','08123456789',1968-08-11,'cj@sanandreas.com')
                                      *
ERROR at line 2:
ORA-00932: inconsistent datatypes: expected DATE got NUMBER 


SQL> INSERT INTO Member VALUES (
  2  1,'Carl Jhonson','08123456789','TO_DATE('1968-08-11','DD-MM-YYYY'),'cj@sanandreas.com');
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> desc Member
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ID_MEMBER                                                                                                         NOT NULL NUMBER(38)
 NAMA                                                                                                                       VARCHAR2(100)
 NO_HP                                                                                                                      VARCHAR2(15)
 TGL_LAHIR                                                                                                                  DATE
 EMAIL                                                                                                                      VARCHAR2(100)

SQL> INSERT INTO Member VALUES (
  2  1,'Carl Jhonson','08123456789',TO_DATE('1968-08-11','DD-MM-YYYY'),'cj@sanandreas.com');
1,'Carl Jhonson','08123456789',TO_DATE('1968-08-11','DD-MM-YYYY'),'cj@sanandreas.com')
                                       *
ERROR at line 2:
ORA-01861: literal does not match format string 


SQL> INSERT INTO Member VALUES (
  2  1,'Carl Jhonson','08123456789','TO_DATE('1968-08-11','YYYY-MM-DD'),'cj@sanandreas.com');
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> INSERT INTO Member VALUES (
  2  1,'Carl Jhonson','08123456789',TO_DATE('1968-08-11','YYYY-MM-DD'),'cj@sanandreas.com');

1 row created.

SQL> INSERT INTO Member VALUES (
  2  2,'Arthur Schopenhauer','081222021788',TO_DATE('1788-02-22','YYYY-MM-DD'),'schopenhauer@filsuf.com');

1 row created.

SQL> INSERT INTO Member VALUES (
  2  3,'Brian Oconner','08123456987',TO_DATE('1978-07-14','YYYY-MM-DD'),'fast@furious.com');

1 row created.

SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                                                                                                 NO_HP           TGL_LAHIR                                                               
---------- ---------------------------------------------------------------------------------------------------- --------------- ---------                                                               
EMAIL                                                                                                                                                                                                   
----------------------------------------------------------------------------------------------------                                                                                                    
         1 Carl Jhonson                                                                                         08123456789     11-AUG-68                                                               
cj@sanandreas.com                                                                                                                                                                                       
                                                                                                                                                                                                        
         2 Arthur Schopenhauer                                                                                  081222021788    22-FEB-88                                                               
schopenhauer@filsuf.com                                                                                                                                                                                 
                                                                                                                                                                                                        
         3 Brian Oconner                                                                                        08123456987     14-JUL-78                                                               
fast@furious.com                                                                                                                                                                                        
                                                                                                                                                                                                        

SQL> SET LINESIZE 150
SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                                                                                                 NO_HP           TGL_LAHIR             
---------- ---------------------------------------------------------------------------------------------------- --------------- ---------             
EMAIL                                                                                                                                                 
----------------------------------------------------------------------------------------------------                                                  
         1 Carl Jhonson                                                                                         08123456789     11-AUG-68             
cj@sanandreas.com                                                                                                                                     
                                                                                                                                                      
         2 Arthur Schopenhauer                                                                                  081222021788    22-FEB-88             
schopenhauer@filsuf.com                                                                                                                               
                                                                                                                                                      
         3 Brian Oconner                                                                                        08123456987     14-JUL-78             
fast@furious.com                                                                                                                                      
                                                                                                                                                      

SQL> SET WRAP OFF
SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                                                                                                 NO_HP           TGL_LAHIR EMAIL       
---------- ---------------------------------------------------------------------------------------------------- --------------- --------- ------------
         1 Carl Jhonson                                                                                         08123456789     11-AUG-68 cj@sanandrea
         2 Arthur Schopenhauer                                                                                  081222021788    22-FEB-88 schopenhauer
         3 Brian Oconner                                                                                        08123456987     14-JUL-78 fast@furious

SQL> SET LINESIZE 300
SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                                                                                                 NO_HP           TGL_LAHIR EMAIL                                                                                                                                                             
---------- ---------------------------------------------------------------------------------------------------- --------------- --------- ----------------------------------------------------------------------------------------------------                                                              
         1 Carl Jhonson                                                                                         08123456789     11-AUG-68 cj@sanandreas.com                                                                                                                                                 
         2 Arthur Schopenhauer                                                                                  081222021788    22-FEB-88 schopenhauer@filsuf.com                                                                                                                                           
         3 Brian Oconner                                                                                        08123456987     14-JUL-78 fast@furious.com                                                                                                                                                  

SQL> SET WRAP ON
SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                                                                                                 NO_HP           TGL_LAHIR EMAIL                                                                                                                                                             
---------- ---------------------------------------------------------------------------------------------------- --------------- --------- ----------------------------------------------------------------------------------------------------                                                              
         1 Carl Jhonson                                                                                         08123456789     11-AUG-68 cj@sanandreas.com                                                                                                                                                 
         2 Arthur Schopenhauer                                                                                  081222021788    22-FEB-88 schopenhauer@filsuf.com                                                                                                                                           
         3 Brian Oconner                                                                                        08123456987     14-JUL-78 fast@furious.com                                                                                                                                                  

SQL> SET LINESIZE 200
SQL> COLUMN nama FORMAT A20
SQL> COLUMN email FORMAT A25
SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                 NO_HP           TGL_LAHIR EMAIL                                                                                                                                         
---------- -------------------- --------------- --------- -------------------------                                                                                                                     
         1 Carl Jhonson         08123456789     11-AUG-68 cj@sanandreas.com                                                                                                                             
         2 Arthur Schopenhauer  081222021788    22-FEB-88 schopenhauer@filsuf.com                                                                                                                       
         3 Brian Oconner        08123456987     14-JUL-78 fast@furious.com                                                                                                                              

SQL> INSERT INTO Jadwal VALUES (
  2  1,1,1,TO_DATE('10-03-2026 10:00','DD-MM-YYYY HH24:MI'),TO_DATE('10-03-2026 13:00','DD-MM-YYYY HH24:MI') );

1 row created.

SQL> INSERT INTO Jadwal VALUES (
  2  2,2,2,TO_DATE('10-03-2026 14:00','DD-MM-YYYY HH24:MI'),TO_DATE('10-03-2026 16:00','DD-MM-YYYY HH24:MI') );

1 row created.

SQL> INSERT INTO Jadwal VALUES (
  2  3,3,3,TO_DATE('10-03-2026 17:00','DD-MM-YYYY HH24:MI'),TO_DATE('10-03-2026 20:00','DD-MM-YYYY HH24:MI') );

1 row created.

SQL> SELECT * FROM Jadwal;

 ID_JADWAL    ID_FILM ID_THEATER PERIODE_S PERIODE_E                                                                                                                                                    
---------- ---------- ---------- --------- ---------                                                                                                                                                    
         1          1          1 10-MAR-26 10-MAR-26                                                                                                                                                    
         2          2          2 10-MAR-26 10-MAR-26                                                                                                                                                    
         3          3          3 10-MAR-26 10-MAR-26                                                                                                                                                    

SQL> INSERT INTO Inventaris VALUES (1,1,'A1');

1 row created.

SQL> INSERT INTO Inventaris VALUES (2,1,'A2');

1 row created.

SQL> INSERT INTO Inventaris VALUES (3,1,'A3');

1 row created.

SQL> SELECT * FROM Inventaris;

ID_INVENTARIS ID_THEATER NOMOR_KURS                                                                                                                                                                     
------------- ---------- ----------                                                                                                                                                                     
            1          1 A1                                                                                                                                                                             
            2          1 A2                                                                                                                                                                             
            3          1 A3                                                                                                                                                                             

SQL> INSERT INTO Transaksi VALUES (
  2  1,1,1,'Lunas',
  3  TO_DATE('07-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL> INSERT INTO Transaksi VALUES (
  2  2,1,2,'Lunas',
  3  TO_DATE('07-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL> SELECT * FROM Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
             1          1          1 Lunas                07-MAR-26       50000                                                                                                                         
             2          1          2 Lunas                07-MAR-26       50000                                                                                                                         

SQL> DELETE FROM Transaksi WHERE kode_pemesanan = 1;

1 row deleted.

SQL> DELETE FROM Transaksi WHERE kode_pemesanan = 2;

1 row deleted.

SQL> SELECT * FROM Transaksi;

no rows selected

SQL> INSERT INTO Transaksi VALUES (
  2  001,1,1,'Lunas',
  3  TO_DATE('07-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL> INSERT INTO Transaksi VALUES (
  2  002,1,2,'Pending',
  3  TO_DATE('08-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL> SELECT * FROM Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
             1          1          1 Lunas                07-MAR-26       50000                                                                                                                         
             2          1          2 Pending              08-MAR-26       50000                                                                                                                         

SQL> DELETE FROM Transaksi WHERE kode_pemesanan = 1;

1 row deleted.

SQL> DELETE FROM Transaksi WHERE kode_pemesanan = 2;

1 row deleted.

SQL> INSERT INTO Transaksi VALUES (
  2  101,1,1,'Lunas',
  3  TO_DATE('07-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL> INSERT INTO Transaksi VALUES (
  2  202,1,2,'Pending',
  3  50000);
INSERT INTO Transaksi VALUES (
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> INSERT INTO Transaksi VALUES (
  2  202,1,2,'Pending',
  3  TO_DATE('08-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL> SELECT * FROM Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
           101          1          1 Lunas                07-MAR-26       50000                                                                                                                         
           202          1          2 Pending              08-MAR-26       50000                                                                                                                         

SQL> INSERT INTO Transaksi VALUES (
  2  103,1,1,'Lunas',
  3  TO_DATE('08-03-2026','DD-MM-YYYY'),
  4  50000);

1 row created.

SQL>  INSERT INTO Member VALUES (
  2  4,'Nadine Abigail','08123654789',TO_DATE('2006-09-29','YYYY-MM-DD'),'nadine@rep62.official');

1 row created.

SQL>  INSERT INTO Member VALUES (
  2  5,'Vazor Fitzgerald','08123654780',TO_DATE('2006-09-16','YYYY-MM-DD'),'fitzgerald@email.com');

1 row created.

SQL> SELECT * FROM Member;

 ID_MEMBER NAMA                 NO_HP           TGL_LAHIR EMAIL                                                                                                                                         
---------- -------------------- --------------- --------- -------------------------                                                                                                                     
         1 Carl Jhonson         08123456789     11-AUG-68 cj@sanandreas.com                                                                                                                             
         2 Arthur Schopenhauer  081222021788    22-FEB-88 schopenhauer@filsuf.com                                                                                                                       
         3 Brian Oconner        08123456987     14-JUL-78 fast@furious.com                                                                                                                              
         4 Nadine Abigail       08123654789     29-SEP-06 nadine@rep62.official                                                                                                                         
         5 Vazor Fitzgerald     08123654780     16-SEP-06 fitzgerald@email.com                                                                                                                          

SQL> SELECT * FROM Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
           101          1          1 Lunas                07-MAR-26       50000                                                                                                                         
           202          1          2 Pending              08-MAR-26       50000                                                                                                                         
           103          1          1 Lunas                08-MAR-26       50000                                                                                                                         

SQL> INSERT INTO Transaksi VALUES (
  2  203,2,3,'Pending',
  3  TO_DATE('09-03-2026','DD-MM-YYYY'),
  4  45000);

1 row created.

SQL> INSERT INTO Transaksi VALUES (
  2  201,2,4,'Pending',
  3  TO_DATE('09-03-2026','DD-MM-YYYY'),
  4  45000);

1 row created.

SQL> SELECT * FROM Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
           101          1          1 Lunas                07-MAR-26       50000                                                                                                                         
           202          1          2 Pending              08-MAR-26       50000                                                                                                                         
           103          1          1 Lunas                08-MAR-26       50000                                                                                                                         
           203          2          3 Pending              09-MAR-26       45000                                                                                                                         
           201          2          4 Pending              09-MAR-26       45000                                                                                                                         

SQL> UPDATE Transaksi set status = 'Refund' where kode_pemesanan = 101;

1 row updated.

SQL> SELECT * FROM Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
           101          1          1 Refund               07-MAR-26       50000                                                                                                                         
           202          1          2 Pending              08-MAR-26       50000                                                                                                                         
           103          1          1 Lunas                08-MAR-26       50000                                                                                                                         
           203          2          3 Pending              09-MAR-26       45000                                                                                                                         
           201          2          4 Pending              09-MAR-26       45000                                                                                                                         

SQL> UPDATE Transaksi set status = 'Lunas' where kode_pemesanan = 202;

1 row updated.

SQL> UPDATE Transaksi set total_harga = '85000' where kode_pemesanan = 203;

1 row updated.

SQL> UPDATE Transaksi set total_harga = '75000' where kode_pemesanan = 201;

1 row updated.

SQL> UPDATE Transaksi set tanggal = TO_DATE('09-03-2026','DD-MM-YYYY') where kode_pemesanan = 101;

1 row updated.

SQL> SELECT * From Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
           101          1          1 Refund               09-MAR-26       50000                                                                                                                         
           202          1          2 Lunas                08-MAR-26       50000                                                                                                                         
           103          1          1 Lunas                08-MAR-26       50000                                                                                                                         
           203          2          3 Pending              09-MAR-26       85000                                                                                                                         
           201          2          4 Pending              09-MAR-26       75000                                                                                                                         

SQL> DELETE FROM Transaksi where status = 'Refund';

1 row deleted.

SQL> DELETE FROM Transaksi where kode_pemesanan = 203;

1 row deleted.

SQL> SELECT * From Transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA                                                                                                                         
-------------- ---------- ---------- -------------------- --------- -----------                                                                                                                         
           202          1          2 Lunas                08-MAR-26       50000                                                                                                                         
           103          1          1 Lunas                08-MAR-26       50000                                                                                                                         
           201          2          4 Pending              09-MAR-26       75000                                                                                                                         

SQL> spool off
