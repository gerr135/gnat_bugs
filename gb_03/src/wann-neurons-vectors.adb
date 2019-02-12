pragma Ada_2012;

with Ada.Numerics.Float_Random;

package body wann.neurons.vectors is

    ----------------
    -- To/FromRec --
    --
    overriding
    function ToRepr (neur : Neuron) return NeuronRepr is
        NR : NeuronRepr(Ni => InputIndex_Base (neur.inputs.Length),
                       No => OutputIndex_Base(neur.outputs.Length));
    begin
        NR.idx     := neur.idx;
        return NR;
    end ToRepr;

    overriding
    procedure FromRepr (NI : in out Neuron; LR : NeuronRepr) is
    begin
        --  Generated stub: replace with real body!
        pragma Compile_Time_Warning (Standard.True, "FromRec unimplemented");
        raise Program_Error with "Unimplemented procedure FromRec";
    end FromRepr;


    not overriding
    function Create(activation : Activation_Type;
                    connections : NN.Input_Connection_Array;
                    maxWeight : Real) return Neuron
    is
        neur : Neuron;
        G : Ada.Numerics.Float_Random.Generator;
        use Ada.Numerics.Float_Random;
    begin
        neur.idx := 0;
        neur.activat := activation;
        neur.lag := 0.0;
        -- populate inputs and weights vectors
        for i in connections'Range loop
            neur.inputs.Append(connections(i));
        end loop;
        return neur;
    end Create;

end wann.neurons.vectors;
