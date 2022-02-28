![Repository Logo](documentation/logo-cmake-github.svg)
# Modern CMake Templates

In this repository you will find a CMake template that covers all common use cases of CMake. Just copy the repository, add your C++ code and you're ready to go. In addition, there is a detailed guide on how to use CMake and how to structure a project.

<details>
<summary>Credit where Credit is due</summary>
    
## Credit where Credit is due
    
This repository is mostly base on the [Ulitmate Guide to Modern CMake](https://rix0r.nl/blog/2015/08/13/cmake-guide/) (the blog is no longer maintained and therefore does not have a valid certificate) by Rico a presumably former Site Reliability Enginee at Google (again, no information past 2016 in his blog).
</details>

<details>
<summary>Motivation</summary>
    
## Motivation
    
Even though the guide was written in 2015, many of the CMake scripts I have come across in my career as a pupil, freelancer, student and now research assistant are far from modern CMake. Partly because the master tutorials still explain legacy CMake (versions before 3.10) and partly because big libraries like GTK3 still haven't switched over. I will use this repository and continue to develop and maintain my CMake templates and thus keep Rico's work alive. If you have any comments or suggestions for improvement, I would be happy to receive an issue or pull request.
</details>


<details>
<summary>Why are there so many Problemes with CMake?</summary>
    
## Why are there so many Problemes with CMake?

Most of the problems that programmers have with CMake can be traced directly back to the developers of the library that the user wants to use. Poor documentation requiring in-depth knowledge of CMake, inconsistent naming of variable, outdated CMake scripts are common causes of frustration. The old mantras "never change a running system", "maintain backwards compatability" or simply "it works why bother" should not be used as an excuse not to update a CMake script. 

Most developers answer the question about a new CMake script with:

![CMake Meme](https://memegenerator.net/img/instances/62346306.jpg)

My answer is: Yes! Yes you do.
</details>

## What does this Repository contain?

In this repository you will find a CMake template that covers all common use cases of CMake. Just copy the repository, add your C++ code and you're ready to go. In addition, there is a detailed guide on how to use CMake and how to structure a project. In addition, each CMake script contains detailed comments about the individual commands.

# Instruction on Modern CMake

Here you will find detailed instructions for modern CMake projects.

![Repository Logo](documentation/cmake-structure.svg)

## Directory Structure

A well-written C++ application can be divided into three parts.
- A library that represents all relevant and reusable functionalities.
- One or more tools that use this library. 
- A set of unit tests that ensure that the library works correctly.
We find the structure identical in our folder structure. 

```
└── src 
    ├── tools
    │   └── src
    ├── library 
    │   ├── include
    │   └── src
    └── test
        └── src
```

An attentive reader may now ask why the library has an `include` directory and the other applications do not. The reason is identical to the private and public keywords in every known programming language: encapsulation. We do not want the user of our library to have access to internal header files. We only want them to have access to interface. The `include` directory is, so to speak, the public part of our code. All files in the `src` directories are installed as binary only and are therefore the private part of our application. It is important to note that the public header files cannot see the private header files.

<details>
    <summary>Example use of this Structure</summary>
    
### Example use of this Structure

Let's look at the structure using the example of a dice. The library provides the functionality to create an n-sided dice. The tool provides a CLI interface to roll a dice and the tests ensure that the dice always provides a correct results. An exemplary structure could look like this:

```
└── src 
    ├── tools
    │   └── src
    │       └── dice_cli_main.cpp
    ├── library 
    │   ├── include
    │   │   └── Dice.hpp
    │   └── src
    │       └── Dice.cpp
    └── test
        └── src
            └── dice_tests.cpp
```

Perhaps you are now asking yourself why the Dice Class is not simply linked against dice_cli and the tests but is outsourced as a library. The answer is **scalability** and **maintainability**.

On the subject of **maintainability**. Imagine you have made a mistake in the Dice class and the distribution of possible eyes is not even. If you now want to correct this error, you only change something in the Dice.cpp but not in the Dice.hpp. This makes it possible to replace the libdice.so (the dynamic library) without having to compile the project from scratch. Replacing the library is then recognised by the operating system and fixes both the dice_cli and the dice_tests. In the dice example, such a procedure may not seem necessary since the application is comparatively small, but it is in the nature of programs to grow very quickly. So get it right from the start to save yourself work later on.

**Scalability** is the second reason why functionality is outsourced to a library. Now imagine that your boss wants to have a dice_ui that displays a small ui in addition to the dice_cli. Without a library, the Dice class would have to be compiled into the application by two people. This makes your software not only larger than necessary, but also more difficult to maintain because you have to fix the bug with the incorrect probabilities in three applications and not just in one library. Thus, the number of different applications automatically reduces maintainability. Poor scalability reduces maintainability!

You can find an example similar to the example with the cube in this repository, which also deals with the concept of private headers.
</details>

### How does the Structure work in CMake?

