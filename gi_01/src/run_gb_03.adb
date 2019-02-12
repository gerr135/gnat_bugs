with Ada.Text_IO; use Ada.Text_IO;
with root.child;

procedure run_gb_03 is

    B : root.child.Base;

begin
    Put_Line("started main");
    B.Set_Smth(1);
end run_gb_03;
