use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'ServerControl-Extension-Tomcat-Tanuki-Wrapper',
   VERSION_FROM => 'lib/ServerControl/Extension/TomcatTanukiWrapper.pm',
   PREREQ_PM => {'ServerControl' => '0.94'},
   LICENSE => 'bsd'
);

