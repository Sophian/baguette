% Octave Tutorial
% http://www.ml-class.org/course/quiz/attempt?quiz_id=39

% Question 1
A = [1 2; 3 4; 5 6];
B = [1 2 3; 4 5 6];

A' * B
A + B
B' + A
B * A

% Question 2
A = [16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1]

A(0:2, 0:4)
A(:, 0:2)
A(1:4, 1:2)
A(:, 1:2)

% Question 3
A = magic(10)
x = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
v = zeros(10, 1)
for i = 1:10
  for j = 1:10
    v(i) = v(i) + A(i, j) * x(j);
  end
end

A .* x
A * x
sum (A * x)
x' * A

% Question 4
v = [1; 2; 3; 4; 5; 6; 7]
w = 2 * v

z = 0;
for i = 1:7
  z = z + v(i) * w(i);
end

v' * w
w * v'
v .* w
sum (v .* w)

% Question 5
X = magic(7)

for i = 1:7
  for j = 1:7
    A(i, j) = log (X(i, j));
    B(i, j) = X(i, j) ^ 2;
    C(i, j) = X(i, j) + 1;
    D(i, j) = X(i, j) / 4;
  end
end

X ^ 2
X + 1
X / 4
log (X)


