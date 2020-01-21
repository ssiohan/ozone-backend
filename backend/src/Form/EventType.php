<?php

namespace App\Form;

use App\Entity\Event;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('type_event')
            ->add('description')
            ->add('updated_at')
            ->add('date_event')
            ->add('status')
            ->add('painfulness')
            ->add('duration')
            ->add('societal_impact')
            ->add('environmental_impact')
            ->add('user_min')
            ->add('user_max')
            ->add('bonus')
            ->add('adress')
            ->add('latitude')
            ->add('longitude')
            ->add('user')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
            'csrf_protection' => false
        ]);
    }
}
