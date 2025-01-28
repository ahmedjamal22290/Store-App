abstract class IsFavState {
  const IsFavState();
}

class IsFavInitial extends IsFavState {
  const IsFavInitial();
}

class IsFavUpdated extends IsFavState {
  final Map<String, bool> favorites;

  const IsFavUpdated(this.favorites);
}
