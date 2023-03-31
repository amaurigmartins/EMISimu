function [out] = writeLCCBranchCard(app,sec)
out = [];

num_phase = getNumPhases(app);
num_shield = getNumShieldWires(app);
num_target = getNumTargets(app);

sw_detached = getDetachedSWindex(app);

seq_target = 'ABCDEFGHIJKLMNOPQRSTUWVXYZ';

seq_in='ABC';
seq_out=valIfTrue(app,isTranspositionTower(app,sec),'CAB','ABC');

for i = 1: num_phase
    
    strphase = sprintf('BRANCH  1%04d%s1%04d%s',sec-1,seq_in(i),sec,seq_out(i));
    
    if i > 3
       strphase = sprintf('BRANCH  2%04d%s2%04d%s',sec-1,seq_in(i-3),sec,seq_out(i-3));
    end
    
    out = strcat(out,strphase,'\n');
end

if num_shield ~= 0 && sw_detached
   strshield = sprintf('BRANCH  0%04d 0%04dM',sec-1,sec);
   out = strcat(out,strshield,'\n');
end



for i = 1 : num_target

    strtarget = sprintf('BRANCH  %s%04d %s%04dM',seq_target(i),sec-1,seq_target(i),sec);
    
    out = strcat(out,strtarget,'\n');
    
end

% num_nodes=getNumPhases(app)+getNumShieldWires(app);
% 
% seq_in='ABC';
% seq_out=valIfTrue(app,isTranspositionTower(app,sec),'CAB','ABC');
% 
% switch num_nodes
%     case 3 % 1 circuit, no shield wire
%         strbranch=sprintf('BRANCH  1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s', ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3));
%         
%     case 4 % 1 circuit, one shield wire
%         strbranch=sprintf('BRANCH  1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s0%05d0%05d', ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,sec);
%         
%     case 5 % 1 circuit, two shield wires
%         strbranch=sprintf('BRANCH  1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s0%05d0%05d', ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,sec);
%         
%     case 6 % 2 circuits, no shield wire
%         strbranch=sprintf('BRANCH  1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s2%04d%s2%04d%s2%04d%s2%04d%s2%04d%s2%04d%s', ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3));
%         
%     case 7 % 2 circuits, one shield wire
%         strbranch=sprintf('BRANCH  1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s2%04d%s2%04d%s2%04d%s2%04d%s2%04d%s2%04d%s\nBRANCH  0%05d0%05d', ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,sec);
%         
%     case 8 % 2 circuits, two shield wires
%         strbranch=sprintf('BRANCH  1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s1%04d%s2%04d%s2%04d%s2%04d%s2%04d%s2%04d%s2%04d%s\nBRANCH  0%05d0%05d', ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,seq_in(1),sec,seq_out(1), ...
%             sec-1,seq_in(2),sec,seq_out(2), ...
%             sec-1,seq_in(3),sec,seq_out(3), ...
%             sec-1,sec);
% end

end

