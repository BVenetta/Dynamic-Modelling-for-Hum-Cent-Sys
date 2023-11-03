clear all
close all
model = l2('bystander-support-model');
model.simulate(10);
model.plot();