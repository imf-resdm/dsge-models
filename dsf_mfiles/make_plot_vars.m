eval([results '= struct([]);']);

%Create and save help variables for report
blag     = [bo b(1:751)']'; 
dclag    = [dco dc(1:751)']';
dlag     = [d_o d(1:751)']';
rstarlag = [r_f+nu rstar(1:751)']'; 
r_dclag  = [r_f+nug r_dc(1:751)']'; 
rlag     = [ro r(1:751)']';
bstarlag = [bstaro bstar(1:751)']'; 
qxlag    = [q_xo qx(1:751)']';
qnlag    = [q_no qn(1:751)']';

growth = (qn-qnlag)/qnlag + (qx-qxlag)/qxlag + g;
cad = d + dc + bstar - (dlag + dclag + bstarlag)./(1+g);
pfd = p.*(b-blag)+d-dlag+dc-dclag-(r_d-g).*dlag./(1+g)-(r_dclag-g).*dclag./(1+g)-(rlag-g).*p.*blag/(1+g);

#rer = pn/px;
#tot = px/pm;
#totmm = px/pmm;

y = qx+qn;
k = kx+kn;
wr = w./p;

eval([results '(1).cad = 100*cad./ynom;']);

eval([results '.pfd = pfd;']);
eval([results '.c = (e+eh)./p;']);
eval([results '.ixn = ix + in;']);
eval([results '.y  = y;']);
eval([results '.wr = w./p;']);
eval([results '.dc = 100*dc./ynom;']);
eval([results '.ddc = 100*(d+dc)./ynom;']);
eval([results '.b = 100.*p.*b./ynom;']);
eval([results '.totaldebt =' results '.b+' results '.ddc;']);
#eval([results '.rer = rer']);
#eval([results '.tot = tot']);
#eval([results '.totmm = totmm']);
#eval([results '.growth = growth;']);

eval(['save ' results '.mat ' results ';']);

eval([results '= 0;']);
