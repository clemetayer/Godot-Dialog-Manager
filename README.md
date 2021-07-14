# Godot-Dialog-Manager
A flexible dialog manager for Godot

## Disclaimer
This tool was intended for a personnal use, but maybe this might be useful for someone else. 

As a consequence, I will mostly maintain it for myself, however, I tried to make it as comprehensible as possible and fairly customizable.

The WAT 5.0.1 plugin was used for the unit tests.

This tool was not intended to make dialogs straight forward like other plugins, it was intended to be flexible.

## Example
An example was provided to show an example use of this tool, to make it easier to understand.

## Usage
To use the dialog manager, place the Tools folder somewhere in your project (it can be renamed if needed). Set the GlobalUtils.gd as an autoload, and set a key to "next_dialog" in the project settings.

The different scripts then can be used, modified or extended.

## Nodes description
Pretty much each node below can be extended or overrided, so you can customize these to create pretty much whatever behaviour you want.

### DialogBox
#### DialogBox
A dialog box that should prompt text to the screen. it should contain a RichTextLabel which should be set in the "TEXT_PATH" variable.
The text speed can be set but has a default value of 0.05s, and a sound to play at each character (optionnal).

The dialog value should be set by another node, and the dialog can be started or stopped with the "startDialog" and "stopDialog" functions.

Contains a "dialog_done" signal when the dialog is done. If the text is too long for the RichTextLabel box, it will be separated in multiple pages.

#### DialogBoxChoices
Extended from DialogBox, but with choices. Choices are buttons that are added if the "CHOICES" variable is not an empty array, as buttons.

A choice is a Dictionnary containing these elements : 
{
    "key":translation key or text of the button,
    "name":name of the choice (just to keep track of what's happening),
    "next_dialogs":Array of dialog paths that should be triggered after this choice is made
}

A "choice_made" signal is emitted when a choice is made.

### DialogNode
#### DialogNode
A dialog node is a node containing the informations of a dialog "step". 
The "DIALOG_KEY" value contains either the translation key of the dialog, or the dialog itself. 
The "BOX_PATH" is the path to the dialog box where the dialog should be displayed (be carefull to not trigger two dialogs on a same dialog box).
The "NEXT_DIALOGS" are the DialogNodes (paths) that should be triggered after this one.
The "WAIT_FOR" array contains DialogNodes to wait before starting the dialog (optionnal)

To start or stop the dialog, the function "startDialog" and "stopDialog" can be used. Additionnaly, the "triggerMethodOnDialog" can trigger a specific method on the target dialog box.

#### DialogNodeChoices
Extended from DialogNode, with an additionnal array for choices (the dictionnary template is set automatically).

#### DialogNodeCancel
Extended from DialogNode, to show the dialog, but stop it at a timer stop (CANCEL_TIME).

### DialogTree
A node to manage the DialogNodes, with a "STARTS" to specify the DialogNodes (paths) that are the starting point of the dialog.

to start the dialogs, use the "startDialogs" methods. To stop or trigger a method on the current dialogs, use the "stopCurrentDialogs" and "triggerMethodOnCurrentDialogs" functions.


