with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Vectors;

generic
package wann.nets.vectors is


    type NNet is new NNet_Interface with private;

    overriding
    procedure Add_Neuron(net : in out NNet; neur : in out PN.Neuron_Interface'Class;
                         idx : out NN.NeuronIndex);

private

    use type PN.Neuron_Interface;
    package NV is new Ada.Containers.Indefinite_Vectors(
            Index_Type=>NN.NeuronIndex, Element_Type=>PN.Neuron_Interface'Class);

    type NNet is new NNet_Interface with record
        neurons : NV.Vector;
    end record;


end wann.nets.vectors;

