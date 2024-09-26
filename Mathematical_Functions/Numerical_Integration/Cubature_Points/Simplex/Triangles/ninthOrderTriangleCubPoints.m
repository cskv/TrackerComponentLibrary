function [xi,w]=ninthOrderTriangleCubPoints()
%%NINTHORDERTRIANGLECUBPOINTS Obtain ninth-order cubature points for
%   integration over a triangle in 2D. The points and weights are for the
%   triangle with vertices (1,0), (0,1), (0,0), but can be transformed to
%   any triangle using transformSimplexTriPoints.
%
%INPUTS: None
%
%OUTPUTS: xi A 2XnumCubPoints set of points for the standard triangle.
%          w A 1XnumCubPoints set of cubature weights. This sums to the
%            volume of the triangle (1/2).
%
%This function implements the points given in [1] (19 points).
%
%EXAMPLE:
%Given the vertices of the simplex, we compare a ninth-order moment
%computed using these cubature points to one computed using
%monomialIntSimplex. The results are the same within typical finite
%precision limits.
% [xi,w]=ninthOrderTriangleCubPoints();
% alpha=[6;3];
% theMoment=findMomentFromSamp(alpha,xi,w)
% intVal=monomialIntSimplex(alpha)
%
%REFERENCES:
%[1] F. D. Witherden and P. E. Vincent, "On the identification of symmetric
%    quadrature rules for finite element methods," Computer and Mathematics
%    with Applications, vol. 69, no. 10, pp. 1232-1241, May 2015.
%
%October 2022 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

M=[ -0.33333333333333333333333333333333333333,   -0.33333333333333333333333333333333333333,    0.19427159256559766763848396501457725948;
   -0.12582081701412672546013927112929005464,   -0.74835836597174654907972145774141989072,    0.15565508200954855863347871259880791224;
   -0.74835836597174654907972145774141989072,   -0.12582081701412672546013927112929005464,    0.15565508200954855863347871259880791224;
   -0.12582081701412672546013927112929005464,   -0.12582081701412672546013927112929005464,    0.15565508200954855863347871259880791224;
   -0.62359292876193453951807743906532886378,    0.24718585752386907903615487813065772755,     0.1592954778544205060657835485280905465;
    0.24718585752386907903615487813065772755,   -0.62359292876193453951807743906532886378,     0.1592954778544205060657835485280905465;
   -0.62359292876193453951807743906532886378,   -0.62359292876193453951807743906532886378,     0.1592954778544205060657835485280905465;
  -0.020634961602524744432586150327614401262,   -0.95873007679495051113482769934477119748,   0.062669400454278141073709662574418630986;
   -0.95873007679495051113482769934477119748,  -0.020634961602524744432586150327614401262,   0.062669400454278141073709662574418630986;
  -0.020634961602524744432586150327614401262,  -0.020634961602524744432586150327614401262,   0.062669400454278141073709662574418630986;
      -0.91054097321109458026978682006744727,       0.82108194642218916053957364013489454,   0.051155351317396062523357597117999647955;
       0.82108194642218916053957364013489454,      -0.91054097321109458026978682006744727,   0.051155351317396062523357597117999647955;
      -0.91054097321109458026978682006744727,      -0.91054097321109458026978682006744727,   0.051155351317396062523357597117999647955;
   -0.92632317589052743273036480243322979538,    0.48239719756899604138015974704684765487,   0.086567078754578754578754578754578754579;
    0.48239719756899604138015974704684765487,   -0.92632317589052743273036480243322979538,   0.086567078754578754578754578754578754579;
   -0.55607402167846860864979494461361785949,    0.48239719756899604138015974704684765487,   0.086567078754578754578754578754578754579;
    0.48239719756899604138015974704684765487,   -0.55607402167846860864979494461361785949,   0.086567078754578754578754578754578754579;
   -0.55607402167846860864979494461361785949,   -0.92632317589052743273036480243322979538,   0.086567078754578754578754578754578754579;
   -0.92632317589052743273036480243322979538,   -0.55607402167846860864979494461361785949,   0.086567078754578754578754578754578754579];

 w=M(:,3);
xi=M(:,1:2)';
%Transform the points to the standard triangle.
v1=[-1,-1, 1;
    -1, 1,-1];
v2=[1,0,0;
    0,1,0];
[A,d]=affineTransBetweenTriangles(v1,v2);
xi=bsxfun(@plus,A*xi,d);
w=w/4;
end

%LICENSE:
%
%The source code is in the public domain and not licensed or under
%copyright. The information and software may be used freely by the public.
%As required by 17 U.S.C. 403, third parties producing copyrighted works
%consisting predominantly of the material produced by U.S. government
%agencies must provide notice with such work(s) identifying the U.S.
%Government material incorporated and stating that such material is not
%subject to copyright protection.
%
%Derived works shall not identify themselves in a manner that implies an
%endorsement by or an affiliation with the Naval Research Laboratory.
%
%RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF THE
%SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY THE NAVAL
%RESEARCH LABORATORY FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE ACTIONS
%OF RECIPIENT IN THE USE OF THE SOFTWARE.