%GETARG get arguments from varargin
%  Val=getarg(Name,Default,varargin) searches in varargin for the argument
%  Name, and gets corresponding value Val from the next cell entry. If Name is
%  not found, Default is returned. Case is ignored when looking for Name.
%
%  varargin should be of format {"Name 1",Value1,"Name 2",Value2,...}
%
%  Copyright 2012-2013 Ronald Kaptein, ronaldk@ronaldk.nl
%
%  This file is released under the terms of the GNU General Public License,
%  version 3. See http://www.gnu.org/licenses/gpl.html
 
  
function Val=getarg(Name,Default,varargin)
    Index=find(strcmpi(Name,varargin));
    if isempty(Index)
        Val=Default;
    else
        Val=varargin{Index+1};
    end
end

