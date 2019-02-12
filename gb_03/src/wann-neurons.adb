pragma Ada_2012;

with Ada.Text_IO;

package body wann.neurons is

    procedure Set_Index (NI : in out Neuron_Interface'Class;
        idx : NN.NeuronIndex)
    is
        use Ada.Text_IO;
    begin
        Put("in NI.Set_Index(" & idx'Img & ")  ");
        declare
            NR : NeuronRepr := NI.ToRepr;
        begin
            Put("declared NR,  ");
            NR.idx := idx;
            NI.FromRepr(NR);
        end;
        Put_Line("all done");
        -- quite cumbersome. May be much better to make it primitive abstract overridable by specific implementation
    end Set_Index;


end wann.neurons;
