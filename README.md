jetty
=====

jetty启动多个war工程

目的：利用jetty对多个web工程分别启动，互不影响。<br>

1、先写一个java方法，通过Main来启动Jetty发布war包，可以指定端口以及war包路径<br>
2、通过maven将整个项目打成一个jar包<br>
3、通过shell调用该jar，启动web服务，每次记录项目名称和所占的端口，如果该端口已经占用，那么kill该端口，启动war<br>
