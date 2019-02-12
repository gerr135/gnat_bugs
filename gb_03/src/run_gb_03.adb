with Ada.Text_IO;

with root.child.impl;

procedure run_gb_03 is

    package PR is new root(Real => Float);
    package PRC is new PR.child;
    package PRCI is new PRC.impl;

    B : PRCI.Base;

    use Ada.Text_IO;

begin
    Put_Line("started main");
    B.Set_Smth(1);
end run_gb_03;
