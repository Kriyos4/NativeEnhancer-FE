<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/dddfault/NativeEnhancer-FE-DX10">
    <img src="https://live.staticflickr.com/65535/48841386416_62dc944781_o.png" alt="Logo" width="512" height="97">
  </a>

  <h3 align="center">Simple and Basic Film Emulation shader for ReShade (DirectX 10+ API)</h3>

  <p align="center">
    <a href="https://github.com/dddfault/NativeEnhancer-FE-DX10/issues">Report Bug</a>
    ·
    <a href="https://github.com/dddfault/NativeEnhancer-FE-DX10/issues">Request Feature</a>
    ·
    <a href="https://github.com/dddfault/NativeEnhancer-FE-DX10/archive/master.zip">Download</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [License](#license)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

NativeEnhancer Film Emulation LUT is a LUT preset for ReShade.
Contained in this preset are LUT texture which do all of the hardwork
instead of using bunch of shaders.

A Lookup Table (LUT) is a fuction for mapping an input color to an output color.
Using a texture is extremely fast and has low performance impact compared to using
a multitude of shaders. The LUT textures was created in Photoshop with custom Lightroom
presets to achieve filmic emulation look which hard to do using SweetFX or other shader.

This preset only handles the color. You can enable other effects to enhance the
preset further.

There is 147 Film available, with 5 different Film Type to choose


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
```sh
ReShade 4.x.x, (Latest version is recommended)
```

### Installation

1. [Download](https://github.com/dddfault/NativeEnhancer-FE-DX10/archive/master.zip) this repository (Size : 129 MB (135.946.225 bytes))
2. Extract the downloaded archive to your ReShade shaders folder
3. Start your game, open the ReShade in-game menu and you good to go

<!-- LICENSE -->
## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
  <p align="center">
    <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/80x15.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</p>


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

<p align="center">
    <img src="https://live.staticflickr.com/65535/48841028538_3a16ef73f5_o.png" alt="CINEMVTIC Logo" width="204" height="39">
    <p align="center">This project was inspired from TreyM's CINEMVTIC (discontinued)</p>
</p>
