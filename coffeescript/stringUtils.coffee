# Copyright 2012-2014 OpenBeeLab.
# This file is part of the OpenBeeLab project.

# The OpenBeeLab project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# The OpenBeeLab project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with OpenBeeLab.  If not, see <http://www.gnu.org/licenses/>.


if not String::contain?

    String::contain = (str) -> return @indexOf(str)>=0

if not String::toInt?

    String::toInt = -> return parseInt(@,10)

if not String::startWith?
    
    String::startWith = (str) -> return @indexOf(str) == 0

if not String::replaceAll?
    
    String::replaceAll = (str1,str2) -> return @replace(new RegExp(str1, 'g'), str2)

if not String::isEmpty?
    
    String::isEmpty = () -> return @ is null or @ is ""