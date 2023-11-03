clear all
close all
model = l2('loneliness-l2');
%please change 'always_true' to 'default' if wanting to run the simulation
%with true and false
model.simulate(10, 'always_true');
model.plot()
%model.plot('plot_emotion_reg_ability')
