with wann.neurons;

generic
package wann.nets is

    package PN is new wann.neurons;

    type NNet_Interface is interface;
    type NNet_Access is access NNet_Interface;

    type Neuron_Reference (Data : not null access PN.Neuron_Interface'Class) is private
        with Implicit_Dereference => Data;


    procedure Add_Neuron(net  : in out NNet_Interface;
                         neur : in out PN.Neuron_Interface'Class; -- gotta be neuron itself, not reference, as NNet is essentially a container
                         idx : out NN.NeuronIndex) is abstract;

private

    type Neuron_Reference (Data : not null access PN.Neuron_Interface'Class) is null record;

end wann.nets;

