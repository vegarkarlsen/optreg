
% Init
run ../handout_files/init_files_2021_v2/init05.m
addpath(genpath("../handout_files/template_problem_2"))

% Continous model

A_c = [
    0 1 0 0 0 0;
    0 0 -K_2 0 0 0;
    0 0 0 1 0 0;
    0 0 -K_1*K_pp -K_1*K_pd 0 0;
    0 0 0 0 0 1;
    0 0 0 0 -K_3*K_ep -K_3*K_ed;
    ];

B_c = [ 0 0;
        0 0; 
        0 0; 
        K_1*K_pp 0; 
        0 0; 
        0 K_3*K_ep; ];

% Number of states and inputs
global N nx
nx = size(A_c, 2);
nu = size(B_c, 2);

% Discrete model
Ts = 0.25;

A = eye(nx) + Ts*A_c;
B = Ts*B_c;


% Initial values
x1_0 = pi;                              % Lambda
x2_0 = 0;                               % r
x3_0 = 0;                               % p
x4_0 = 0;                               % p_dot
x5_0 = 0;                               % e
x6_0 = 0;                               % e_dot
x0 = [x1_0 x2_0 x3_0 x4_0 x5_0 x6_0]';            % Initial values

% Time horizon and initialization 

N = 40;
M = N;
n = N*nx+M*nu;
z0 = zeros(n,1);

% cost function
q1 = 1;
q2 = 0;
q3 = 0;
q4 = 0;
q5 = 0;
q6 = 0;
Q = 2*diag([q1,q2,q3,q4,q5,q6]);

r1 = 1;     % q1
r2 = 1;     % q2
R = 2*diag([r1 r2]);

G = 2*gen_q(Q,R,N,M);

% system
Aeq = gen_aeq(A, B, N, nx, nu);
beq = zeros(size(Aeq,1),1);
beq(1:nx) = A*x0;

% Bounds
ul = [-pi/6; -Inf];   % Lower bound on control
uu = [pi/6; Inf];    % Upper bound on control

xl = -Inf*ones(nx, 1);  % Lower bound on states
xu = Inf*ones(nx,1);    % Upper bound on states
xl(3) = ul(1);
xu(3) = uu(1);

% constraints
[vlb,vub] = gen_constraints(N,M,xl,xu,ul,uu);
vlb(n) = 0;
vub(n) = 0;     

% solve
f = @(z) 1/2 *z.'* G *z;
tic
options = optimoptions('fmincon','Algorithm','sqp','MaxFunEvals', 400000);
[z, fval, exitflag] = fmincon(f,z0, [], [], Aeq, beq, vlb, vub, @constraints, options);
toc

% Extract control inputs and states
u1 = [z(N*nx+1:nu:n);z(n-1)];           % Control input 1 from solution
u2 = [z(N*nx+2:nu:n);z(n)];            

x1 = [x0(1);z(1:nx:N*nx)];              
x2 = [x0(2);z(2:nx:N*nx)];              
x3 = [x0(3);z(3:nx:N*nx)];            
x4 = [x0(4);z(4:nx:N*nx)];              
x5 = [x0(5);z(5:nx:N*nx)];              
x6 = [x0(6);z(6:nx:N*nx)];  

num_variables = 5/Ts;
zero_padding = zeros(num_variables,1);
unit_padding  = ones(num_variables,1);

u1   = [zero_padding; u1; zero_padding];
u2   = [zero_padding; u2; zero_padding];
x1  = [pi*unit_padding; x1; zero_padding];
x2  = [zero_padding; x2; zero_padding];
x3  = [zero_padding; x3; zero_padding];
x4  = [zero_padding; x4; zero_padding];
x5  = [zero_padding; x5; zero_padding];
x6  = [zero_padding; x6; zero_padding];

t = 0:Ts:Ts*(length(u1)-1);

% % LQR
% Q_LQR = diag([5, 1, 1, 0.5, 50, 10]); %diag(diag(ones(mx)));
% R_LQR = diag([0.1 0.1]);
% 
% [K_LQR, S, CLP] = dlqr(A, B, Q_LQR, R_LQR);

% to simulink
u_out = [u1 u2].';
u_simulink = timeseries(u_out, t);

x_out = [x1 x2 x3 x4 x5 x6].';
x_simulink = timeseries(x_out, t);


% save("optimal/L4_q1_1_q2_0.01.mat", "u_out", "x_out")


%% plt

figure(1)
plot(t,x5)

%% Plotting


figure(1)
subplot(811)
stairs(t,u1),grid
ylabel('u1')

subplot(812)
stairs(t,u2),grid
ylabel('u2')

subplot(813)
plot(t,x1,'m',t,x1,'mo'),grid
ylabel('lambda')

subplot(814)
plot(t,x2,'m',t,x2','mo'),grid
ylabel('r')

subplot(815)
plot(t,x3,'m',t,x3,'mo'),grid
ylabel('p')

subplot(816)
plot(t,x4,'m',t,x4','mo'),grid
xlabel('tid (s)'),ylabel('pdot')


subplot(817)
plot(t,x5,'m',t,x5','mo'),grid
ylabel('e')


subplot(818)
plot(t,x6,'m',t,x6','mo'),grid
xlabel('tid (s)'),ylabel('edot')





