function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
        fncs{i} = str2func(fncs{i});
    end
end

%ADD RULES BELOW

function result = sdr1(trace, params, t)
    result = {};
    
    for desire = trace(t).desire

        % Question: This comment is followed by two if statements that use
        % 2 different ways to compare strings. The first one uses the
        % strcmp function and the second one a simple ==. Why does it not
        % work to make the first with == (if desire.arg{1}.name == 'form_of_assistance')?!?!?! 
        % The error it shows me is that "Matrix dimensions must agree." It
        % only does now work for the desire{interpretation_of_emergency}
        % why? the dimensions of all the desires are the same
        
            if strcmp(desire.arg{1}.name,'form_of_assistance')
                if desire.arg{1}.arg{1} == 'intervene'
                    result = { result{:} {t+1, 'desire', {predicate('interpretation_of_situation', 'emergency')}}};
                end
            end
    end
    
end

function result = sdr2(trace, params, t)
    result = {};
    
    for desire = trace(t).desire
        if strcmp(desire.arg{1}.name,'interpretation_of_situation')
            if desire.arg{1}.arg{1} == 'emergency'
                    result = { result{:} {t+1, 'desire', {predicate('send_message', true)}}};
            end
        end

    end
    
end

function result = sdr3(trace, params, t)
    result = {};
    
    for desire = trace(t).desire
        if strcmp(desire.arg{1}.name,'send_message')
            if desire.arg{1}.arg{1} == true
                    result = { result{:} {t+1, 'propose', {predicate('send_message', true)}}};
            end
        end

    end
    
end