module com.zaxxer.hikari
{
   requires java.sql;
   requires java.management;
   requires java.naming;
   requires org.slf4j;

   exports com.zaxxer.hikari;
   exports com.zaxxer.hikari.pool;
   exports com.zaxxer.hikari.util;
}
