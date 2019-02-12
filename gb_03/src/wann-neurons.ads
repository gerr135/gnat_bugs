--
-- wann.neurons package. Holds definition and layout of the neuron interface.
--
-- Copyright (C) 2018  <George Shapovalov> <gshapovalov@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

generic
package wann.neurons is

    -------------------------------------
    --  Local input/output indices
    type    InputIndex_Base is new Natural;
    subtype InputIndex is InputIndex_Base range 1 .. InputIndex_Base'Last;
    type    OutputIndex_Base is new Natural;
    subtype OutputIndex is OutputIndex_Base range 1 .. OutputIndex_Base'Last;

    -- associated arrray types for holding params
    type Input_Connection_Array  is array (InputIndex range <>)  of NN.ConnectionIndex;
    type Output_Connection_Array is array (OutputIndex range <>) of NN.ConnectionIndex;
    type Weight_Array  is array (InputIndex_Base range <>) of Real;


    -------------------------------------------------
    -- Neuron representation
    -- To be used for storage, IO and as an alphabet to form a linear description,
    -- a-la DNA/protein sequence. Then the NNet can be simply defined as some linear sequence
    -- in declaration which can be passed to the NNet constructor.
    --
    -- NOTE: outputs are not part of the "base topology", so it might make sense to have
    -- two record types
    type NeuronRec(Ni : InputIndex) is record
        idx     : NN.NeuronIndex_Base; -- own index in NNet
        activat : Activation_Type;
        lag     : Real;    -- delay of result propagation, unused for now
        weights : Weight_Array(0 .. Ni);
        inputs  : Input_Connection_Array  (1 .. Ni);
    end record;
    type NeuronRecPtr is access NeuronRec;

    -- An internal representation that includes more details that might change.
    -- To be used for passing neuron state around
    type NeuronRepr is private;
    type NeuronReprPtr is access NeuronRepr;

    type Neuron_Interface is interface;
    type NeuronClass_Access is access all Neuron_Interface'Class;

    function  ToRepr  (NI : Neuron_Interface) return NeuronRepr is abstract;
    procedure FromRepr(NI : in out Neuron_Interface; LR : NeuronRepr) is abstract;

--     function NInputs (neur : Neuron_Interface) return InputIndex  is abstract;
--     function NOutputs(neur : Neuron_Interface) return OutputIndex is abstract;
--     --
--     function Input (neur : Neuron_Interface; idx : InputIndex)  return NN.ConnectionIndex is abstract;
--     function Output(neur : Neuron_Interface; idx : OutputIndex) return NN.ConnectionIndex is abstract;

    procedure Set_Index  (NI : in out Neuron_Interface'Class; idx : NN.NeuronIndex);

private

    type NeuronRepr(Ni : InputIndex_Base := 0; No : OutputIndex_Base := 0) is record
        idx     : NN.NeuronIndex_Base; -- own index in NNet
        activat : Activation_Type;
        lag     : Real;    -- delay of result propagation, unused for now
        weights : Weight_Array(0 .. Ni);
        inputs  : Input_Connection_Array  (1 .. Ni);
        outputs : Output_Connection_Array (1 .. No);
        -- may add level index this belongs to, to avoid resorting upon structure load..
    end record;

end wann.neurons;
