%PROGRESSBAR Shows a simple progress bar on the command line
%   PROGRESSBAR(N,TOTAL) shows a progress bar with a progression of N on a
%   scale of TOTAL.
%
%	PROGRESSBAR(N,TOTAL,BARLENGTH) uses a bar length of BARLENGTH
%	characters. Default is 40.
%
%	PROGRESSBAR(N,TOTAL,BARLENGTH,DoClear) Set DoClear to 1 to clear the bar
%  when finished.
%
%	PROGRESSBAR is intended for use within a loop. When called outside a
%	loop, it may lead to strange terminal output
%
%	Example: for i=1:30
%		progressbar(i,30); %DO STUFF HERE
%	end
%
%	Example output: ==================......................  45%
%
%   Copyright 2012-2013 Ronald Kaptein, ronaldk@ronaldk.nl
%
%   This file is released under the terms of the GNU General Public License,
%   version 3. See http://www.gnu.org/licenses/gpl.html
%
%   See also waitbar

function progressbar(N,Total,BarLength,DoClear)

    if nargin == 2
        BarLength=40;
        DoClear=1;
    elseif nargin == 3
        DoClear=1;
    end

    TheString=repmat('.',1,BarLength);
    TheString=sprintf('%s %3.0f%%',TheString,(N./Total)*100);

    Ind=round((N./Total)*BarLength);
    TheString(1:Ind)='=';

    %Don't clear the line before the first draw:
    if N > 1
        for i=1:numel(TheString)
            fprintf('\b');
        end
    end

    fprintf('%s',TheString);

    %Clear line or put a new line when bar is finished:
    if N == Total
        if DoClear == 1
            for i=1:numel(TheString)
                fprintf('\b');
            end
        else
            fprintf('\n');
        end
    end
end
