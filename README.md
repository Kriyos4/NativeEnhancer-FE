<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/dddfault/NativeEnhancer-FE">
    <img src="https://live.staticflickr.com/65535/50785904072_47d762805f_o.png" alt="Logo" width="512" height="97">
  </a>

  <h3 align="center">Simple and Basic Film Emulation shader for ReShade (DirectX 10+ API)</h3>

  <p align="center">
    <a href="https://github.com/dddfault/NativeEnhancer-FE/issues">Report Bug</a>
    ·
    <a href="https://github.com/dddfault/NativeEnhancer-FE/issues">Request Feature</a>
    ·
    <a href="https://github.com/dddfault/NativeEnhancer-FE/archive/master.zip">Download</a>
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

NativeEnhancer Film Emulation LUT is a color lookup table texture preset
for ReShade. Contained in this preset are LUT texture which do all of the hardwork
instead of using bunch of shaders.

A Lookup Table (LUT) is a function for mapping an input color to an output color.
Using a texture is extremely fast and has low performance impact compared to using
a multitude of shaders. The LUT textures was created in Photoshop with custom Lightroom
presets to achieve filmic emulation look which hard to do using SweetFX or other shader.

This preset only handles the color. You can enable other effects to enhance the
preset further.

There is 263 analog film LUT available, it is almost double the count from last Version.


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
```sh
ReShade 4.8.x, (Latest version is recommended)
```

### Installation

1. [Download](https://github.com/dddfault/NativeEnhancer-FE/archive/master.zip) this repository
2. Extract the downloaded archive to your ReShade shaders folder
3. Start your game, open the ReShade in-game menu, add this shader path to your preset, and you good to go.

<!-- LICENSE -->
## License

  <p align="center">
    This work is licensed under a MIT License
    <br/>
    Copyright (c) 2020 dddfault
  </p>


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
