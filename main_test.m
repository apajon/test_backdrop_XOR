clear all

clc

addpath class/ function/
%%
% parent=[1 1 0];
% b=0;
% toto=neurone(parent,b);
% toto.test(8)

%%
NumberOfCouche=2;
%%
NeuralNetwork=[];

test=2;
switch test
    case 1
        NeuralNetwork.lvl_0(1)=neurone([0 0 0],0);
        NeuralNetwork.lvl_0(2)=neurone([0 0 0],0);

        NeuralNetwork.(['lvl_' '1'])=neurone([0 1 0;0 2 0],0);

        NeuralNetwork.(['lvl_' '2'])=neurone([0 1 0;0 2 0;1 1 0],0);
    case 2
        NeuralNetwork.lvl_0(1)=neurone([0 0 0],0);
        NeuralNetwork.lvl_0(2)=neurone([0 0 0],0);

        NeuralNetwork.(['lvl_' '1'])=neurone([0 1 7.1;0 2 7.1],-2.76);

        NeuralNetwork.(['lvl_' '2'])=neurone([0 1 -4.95;0 2 -4.95;1 1 10.9],-3.29);
end

%%
NeuralNetwork.lvl_0(1).activation_unit=1;
NeuralNetwork.lvl_0(2).activation_unit=0;


for i=1:NumberOfCouche
    for j=1:size(NeuralNetwork.(['lvl_' num2str(i)]),2)
        value_temp=0;
        for k=1:size(NeuralNetwork.(['lvl_' num2str(i)])(j).parent,1)
            parent_Id_level=NeuralNetwork.(['lvl_' num2str(i)])(j).parent(k,1);
            parent_Id_number=NeuralNetwork.(['lvl_' num2str(i)])(j).parent(k,2);
            parent_weight=NeuralNetwork.(['lvl_' num2str(i)])(j).parent(k,3);
            value_temp=value_temp+NeuralNetwork.(['lvl_' num2str(parent_Id_level)])(parent_Id_number).activation_unit*parent_weight;
        end
        NeuralNetwork.(['lvl_' num2str(i)])(j).updateActivation_value(value_temp+1*NeuralNetwork.(['lvl_' num2str(i)])(j).b);
%         NeuralNetwork.(['lvl_' num2str(i)])(j).updateActivation_unit();
    end
end

%%
NeuralNet=NeuralNetwork(2,[2 1 1]);

test=1;
switch test
    case 1
        NeuralNet.neurones.lvl_0(1)=neurone([0 0 0],0);
        NeuralNet.neurones.lvl_0(2)=neurone([0 0 0],0);

        NeuralNet.neurones.(['lvl_' '1'])=neurone([0 1 0;0 2 0],0);

        NeuralNet.neurones.(['lvl_' '2'])=neurone([0 1 0;0 2 0;1 1 0],0);
    case 2
        NeuralNet.neurones.lvl_0(1)=neurone([0 0 0],0);
        NeuralNet.neurones.lvl_0(2)=neurone([0 0 0],0);

        NeuralNet.neurones.(['lvl_' '1'])=neurone([0 1 7.1;0 2 7.1],-2.76);

        NeuralNet.neurones.(['lvl_' '2'])=neurone([0 1 -4.95;0 2 -4.95;1 1 10.9],-3.29);
end
NeuralNet.buildChildren();

NeuralNet.neurones.lvl_0(1).activation_unit=1;
NeuralNet.neurones.lvl_0(2).activation_unit=0;
NeuralNet.neurones.lvl_2(1).target_unit=xor(NeuralNet.neurones.lvl_0(1).activation_unit,...
                                            NeuralNet.neurones.lvl_0(2).activation_unit);

NeuralNet.updateActivation();

NeuralNet.neurones.lvl_2(1).activation_unit

v=0.1;
NeuralNet.updateError(v);

NeuralNet.updateActivation();

NeuralNet.neurones.lvl_2(1).activation_unit

%%
NeuralNet=NeuralNetwork(2,[2 1 1]);

test=1;
switch test
    case 1
        NeuralNet.neurones.lvl_0(1)=neurone([0 0 0],0);
        NeuralNet.neurones.lvl_0(2)=neurone([0 0 0],0);

        NeuralNet.neurones.(['lvl_' '1'])=neurone([0 1 0;0 2 0],0);

        NeuralNet.neurones.(['lvl_' '2'])=neurone([0 1 0;0 2 0;1 1 0],0);
    case 2
        NeuralNet.neurones.lvl_0(1)=neurone([0 0 0],0);
        NeuralNet.neurones.lvl_0(2)=neurone([0 0 0],0);

        NeuralNet.neurones.(['lvl_' '1'])=neurone([0 1 7.1;0 2 7.1],-2.76);

        NeuralNet.neurones.(['lvl_' '2'])=neurone([0 1 -4.95;0 2 -4.95;1 1 10.9],-3.29);
end
NeuralNet.buildChildren();

tableInputXOR=[0 0
    0 1
    1 0
    1 1];
tableOutputXOR=[0
    1
    1
    0];

v=2;

j=0;
j_max=480;
while j<j_max
    for i=[3 1 2 4];%1:size(tableInputXOR,1)
        if j==j_max-1
            i
        end
        NeuralNet.neurones.lvl_0(1).activation_unit=tableInputXOR(i,1);
        NeuralNet.neurones.lvl_0(2).activation_unit=tableInputXOR(i,2);
        NeuralNet.neurones.lvl_2(1).target_unit=xor(NeuralNet.neurones.lvl_0(1).activation_unit,...
                                                    NeuralNet.neurones.lvl_0(2).activation_unit);

        NeuralNet.updateActivation();
        
        if i==j_max-1
            NeuralNet.neurones.lvl_2(1).activation_unit
        end
        
        NeuralNet.updateError(v);

        NeuralNet.updateActivation();
        
        if j==j_max-1
            NeuralNet.neurones.lvl_2(1).activation_unit
        end
    end
    
    j=j+1;
end
%%
for i=1:4
    NeuralNet.neurones.lvl_0(1).activation_unit=tableInputXOR(i,1);
            NeuralNet.neurones.lvl_0(2).activation_unit=tableInputXOR(i,2);
            NeuralNet.neurones.lvl_2(1).target_unit=xor(NeuralNet.neurones.lvl_0(1).activation_unit,...
                                                        NeuralNet.neurones.lvl_0(2).activation_unit);
    NeuralNet.updateActivation();

    NeuralNet.neurones.lvl_2(1).activation_unit
end