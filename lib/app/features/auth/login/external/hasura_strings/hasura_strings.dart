const String getUserHasuraStringQuery = r'''query MyQuery($email: String!) {
  users(where: {email: {_eq: $email}}) {
    created_at
    email
    firebase_uid
    id
    name
    push_token
    updated_at
  }
}
''';
