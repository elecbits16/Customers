clc;
fileID = fopen('Z:/elecbits original/matlabp/tweet.txt');
c = textscan(fileID,'%s','Delimiter','|');
m = strtrim(c)
fclose(fileID);
n = size(m);
out = cellfun('prodofsize', m);

fileID_neg = fopen('Z:/elecbits original/matlabp/negative-words.txt');
c_neg = textscan(fileID_neg,'%s','Delimiter','|');
m_neg = strtrim(c_neg)
fclose(fileID_neg);
n_neg = size(m_neg);
out_neg = cellfun('prodofsize', m_neg);

fileID_pos = fopen('Z:/elecbits original/matlabp/positive-words.txt');
c_pos = textscan(fileID_pos,'%s','Delimiter','|');
m_pos = strtrim(c_pos)
fclose(fileID_pos);
n_pos = size(m_pos);
out_pos = cellfun('prodofsize', m_pos);

fidneg = fopen('Z:/elecbits original/matlabp/analysis/negative_training.txt','wt');
yy = 0;
for i = 1:out
    
	for j = 1 : out_neg

f = seqwordcount(m{1}{i}, m_neg{1}{j});

str_neg=strcat('\n', m_neg{1}{j});
if(f > 0 )
{  
fprintf(fidneg, str_neg);

}
end

yy = f + yy;
       
   
end

end
fclose(fidneg);

Negative_emotions = yy;
display(Negative_emotions);

fidpos = fopen('Z:/elecbits original/matlabp/analysis/positive_training.txt','wt');
xx = 0;
for i = 1:out
    
	for j = 1 : out_pos

t = seqwordcount(m{1}{i}, m_pos{1}{j});

str_pos=strcat('\n', m_pos{1}{j});
if(t > 0) 
{
fprintf(fidpos, str_pos);
}
end


xx = t + xx;
       
   
end

end
fclose(fidpos);
 
Positive_emotions = xx;
display(Positive_emotions);




F = [xx, yy]

total = sum(F);



percentage1= (xx/total)* 100;
percentage2= (yy/total)* 100 ;

s1 = strcat('Positive :', num2str(percentage1),'%');
s2 = strcat('Negative :', num2str(percentage2),'%');

labels = {s1,s2};
explode=[1,1];

percentage = [percentage1, percentage2];

pie(percentage,explode, labels);

title('Sentiment Analysis');





%display(m{1}{72});
%display(out);

%display(m_neg{1}{3});
%display(out_neg);

%display(m_pos{1}{3});
%display(out_pos);







% celldisp(m_neg);
% celldisp(m_pos);

