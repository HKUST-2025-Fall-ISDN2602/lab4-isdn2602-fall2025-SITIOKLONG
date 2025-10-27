function msgblk = blk_decoder(codeword)

% compute syndrome bits
% If we rearrange the codeword bits 1 to 8 as 
%   1 2 5
%   3 4 6
%`  7 8
% The parity checks correspond to checking the parity of the bits indexed
% by the columns of the matrix below
ind = [1 3 1 2;...
       2 4 3 4;...
       5 6 7 8 ];   
% We can check parity by summing down the rows and then taking the modulus
% after division by two.
S = mod(sum(codeword(ind)),2);

% assume no error at first
msgblk = codeword(1:4);

% compute syndrome bits
S = zeros(1,4);
S(1) = rem(sum(codeword([1 2 5])),2);
S(2) = rem(sum(codeword([3 4 6])),2);
S(3) = rem(sum(codeword([1 3 7])),2);
S(4) = rem(sum(codeword([2 4 8])),2);

% % check for one bit errors in the message block only
% % There are four possible one bit errors in the message block
% 
% % Modify the code below
% Interpret the 4-bit syndrome S and correct single-bit errors.
if isequal(S,[0 0 0 0])
    % no error -> do nothing
elseif isequal(S,[1 0 1 0])          % bit 1
    msgblk(1) = ~msgblk(1);
elseif isequal(S,[1 0 0 1])          % bit 2
    msgblk(2) = ~msgblk(2);
elseif isequal(S,[0 1 1 0])          % bit 3
    msgblk(3) = ~msgblk(3);
elseif isequal(S,[0 1 0 1])          % bit 4
    msgblk(4) = ~msgblk(4);
end





