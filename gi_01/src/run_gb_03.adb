with Ada.Text_IO; use Ada.Text_IO;
with issue;
with wa1;
with wa2;

procedure run_gb_03 is

    B1 : wa1.Base;
    B2 : wa2.Base;
    BI : issue.Base;

begin
    Put_Line("started main");
    Put_Line("starting workaround 1");
    B1.Set_Smth(1);
    Put_Line("workaround 1 done");
    New_Line;
    Put_Line("starting workaround 2");
    B2.Set_Smth(1);
    Put_Line("workaround 2 done");
    New_Line;
    Put_Line("starting issue");
    BI.Set_Smth(1);
    Put_Line("issue done");
end run_gb_03;
