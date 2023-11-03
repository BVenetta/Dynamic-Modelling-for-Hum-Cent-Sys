function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
    fncs{i} = str2func(fncs{i});
    end
end

function result = ddr3( trace, params, t)
    result = {};
    %go through each emotion level of 1 agent
    for had_emotion_regulation = trace(t).had_emotion_regulation
        agent = had_emotion_regulation.arg{1}; %agent name
        emotion_regulation = had_emotion_regulation.arg{2}; %the emotion level
        %initialize variable to calculate emotion change
        value = 0;
        for has_emotion_training = trace(t).has_emotion_training
            agent = has_emotion_training.arg{1};
            train = has_emotion_training.arg{2};
            if train == true
                value = value + 1;
            elseif train == false
                value = value + 0;
            end
        end    
    emotion_regulation = emotion_regulation + value;
    result = {result{:} {t+1, 'had_emotion_regulation', {agent, emotion_regulation}} };
    end
end