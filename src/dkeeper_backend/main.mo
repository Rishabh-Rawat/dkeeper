import List "mo:base/List";
import Text "mo:base/Text";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title : Text;
    content : Text;
  };

  stable var notes = List.nil<Note>();

  public func createNote(title : Text, content : Text) {
    let newNote : Note = { title = title; content = content };

    notes := List.push(newNote, notes);
  };

  Debug.print(debug_show (notes));

  public query func readNotes() : async ([Note]) {
    return List.toArray(notes);
  };

  public func removeNote(id : Nat) {
    notes := List.append(List.take(notes, id), List.drop(notes, id +1));
  };

};
