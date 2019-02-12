with Ada.Text_IO, Ada.Integer_Text_IO;

with root.child.impl;

procedure run_gb_03 is

    package PR is new Root(Real => Float);
    package PRC is new PR.child;
    package PRCI is new PRC.impl;

    use Ada.Text_IO;

    B : PRCI.Base;

begin
    Put_Line("started main");
    B.set_SMth(1);
end run_gb_03;
