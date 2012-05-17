# SectorDataProvider#
## An Objective-C Framework for reading navigation data for the purpose of drawing radar sectors for use with the VATSIM (www.vatsim.net) flight-simulation network ##

SectorDataProvider is an Objective-C Framework which abstracts sector data for use in the VATSIM network.  It is designed to hide the implementation details of the data source(s) from the user.  In the future, it may handle sector data coming from a .SCT2 file, a database or an as-yet defined file format.  However, only the .SCT2 parser is provided at this time.

##Usage:  

Include the SectorDataProvider framework in your project.  In addition to the SectorDataProvider object, you'll find public objects for all the components of a sector file including NavAid's such as VORs, NDBs and Fixes, and geometrical objects such as runways, airports, GEO's, Regions, etc.

##Contributions

Contributions to the code are certainly welcome.  By contributing, you agree that your code may become a permanent part of the project, and is subject to the same license as the project as a whole.  You further certify your code is your own and does not contain stolen intellectual property.

##License

SectorData Provider uses a BSD-style license.

Copyright (c) 2012, Wade Williams
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.