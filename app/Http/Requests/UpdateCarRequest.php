<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Validator;

class UpdateCarRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'brand' => ['string', 'max:255'],
            'model' => ['string', 'max:255'],
            'reservoir' => ['numeric', 'min:0'],
            'consumption' => ['numeric', 'min:0'],
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'brand.required' => 'Un nom de marque est requis.',
            'model.required' => 'Le modèle du véhicule est requis.',
            'reservoir.required' => 'La quantité du réservoir est requise.',
            'consumption.required' => 'La consommation du véhicule est requise.',
        ];
    }

    protected function failedValidation(Validator|\Illuminate\Contracts\Validation\Validator $validator)
    {
        throw new HttpResponseException(response()->json($validator->errors(), 422));
    }
}
