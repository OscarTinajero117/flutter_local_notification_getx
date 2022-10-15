///Posibles respuestas
///```
///ok           //Acceso concedido
///accessDenied //Acceso no concedido (error de autentificación)
///networkError //Error en la red (fallas del API o conexión a Internet inestable)
///unknownError //Error desconocido, posibles fallos en el parseo de datos
///noToken      //Error al buscar el token de manera local o vencido en API
///noData      //Se logró la petición, pero no existen datos remotos
///```
enum ResponseAPI {
  ok,
  accessDenied,
  networkError,
  unknownError,
  noToken,
  noData,
}

// ///Posibles respuestas del sign up [registro]
// ///```
// ///ok            //Registro exitoso
// ///accountDenied //Cuenta (Correo) ya en uso
// ///networkError  //Error en la red (fallas del API o conexión a Internet inestable)
// ///unknownError  //Error desconocido, posibles fallos en el parseo de datos
// ///```
// enum ResponseAPI {
//   ok,
//   accountDenied,
//   networkError,
//   unknownError,
// }

// ///Posibles respuestas de Get Account [obtener cuenta]
// ///```
// ///ok                  //Cuenta encontrada
// ///nonExistentAccount  //Cuenta no existe
// ///networkError        //Error de conexión
// ///unknownError        //Error desconocido, posibles fallos en el parseo de datos
// ///```
// enum GetAccountResponseAPI {
//   ok,
//   nonExistentAccount,
//   networkError,
//   unknownError,
// }

// ///Posibles respuestas de Get Debit [Obtener Adeudo]
// ///```
// ///ok             //Adeudo encontrado
// /////nonExistentId  //ID Padrón no encontrado
// ///networkError   //Error de conexión
// ///unknownError   //Error desconocido, posibles fallos en el parseo de datos
// ///```
// enum GetDebitResponseAPI {
//   ok,
//   // nonExistentId,
//   networkError,
//   unknownError,
// }

// enum GetMovementsResponseAPI{
//   ok,
//   nonExistentId,
//   n
// }
