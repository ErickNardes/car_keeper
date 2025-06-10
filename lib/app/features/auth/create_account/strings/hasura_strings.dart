const createUserHasuraMutationString =
    r'''mutation MyMutation($objects: [users_insert_input!]!) {
  insert_users(objects: $objects) {
    affected_rows
    returning {
      email
      firebase_uid
      id
      name
    }
  }
}''';
