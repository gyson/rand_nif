#[macro_use] extern crate rustler;

extern crate rand;

use rustler::{Env, Term, NifResult, Encoder, Error};
use rand::{thread_rng, Rng};

rustler_export_nifs! {
    "Elixir.RandNif",
    [("uniform", 0, uniform_0),
     ("uniform_noop", 0, uniform_noop_0),
     ("uniform", 1, uniform_1)],
    None
}

fn uniform_0<'a>(env: Env<'a>, _args: &[Term<'a>]) -> NifResult<Term<'a>> {
    Ok(thread_rng().gen::<f64>().encode(env))
}

fn uniform_noop_0<'a>(env: Env<'a>, _args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let x: f64 = 0.0;
    Ok(x.encode(env))
}

fn uniform_1<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let n: u32 = args[0].decode()?;
    if n == 0 {
        return Err(Error::BadArg)
    }
    Ok((thread_rng().gen_range(0, n) + 1).encode(env))
}
