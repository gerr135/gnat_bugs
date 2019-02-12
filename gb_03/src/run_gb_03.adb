with Ada.Text_IO;

with wann.nets.vectors;
with wann.neurons.vectors;

procedure run_gb_03 is

    package PW is new wann(Real => Float);
    package PNet   is new PW.nets;
    package PNetV  is new PNet.vectors;
    package PN renames PNet.PN;
    package PNV is new PN.vectors;

    use PW; use NN;

    neur1 : PNV.Neuron := PNV.Create(Sigmoid, ((I,1),(I,2)), 1.0);
    net1  : PNetV.NNet;

    idx : NN.NeuronIndex_Base;

    use Ada.Text_IO;

begin
    Put_Line("started main");
    net1.Add_Neuron(neur1, idx);
end run_gb_03;
