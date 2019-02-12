pragma Ada_2012;

with Ada.Text_IO;

package body wann.nets.vectors is

    overriding
    procedure Add_Neuron (net : in out NNet;
                          neur : in out PN.Neuron_Interface'Class;
                          idx : out NN.NeuronIndex)
    is
        use type Ada.Containers.Count_Type;
        use Ada.Text_IO;
    begin
        idx := NN.NeuronIndex(net.neurons.Length + 1); -- new index
        Put_Line("net.Add_Neuron(neur," & idx'Img & ")");
        neur.Set_Index(idx);
        Put_Line("net.Add_Neuron  after Set_Index");
    end Add_Neuron;

end wann.nets.vectors;
