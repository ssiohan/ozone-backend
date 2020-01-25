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
            ->add('typeEvent')
            ->add('description')
            ->add('createdAt')
            ->add('updatedAt')
            ->add('dateEvent')
            ->add('status')
            ->add('painfulness')
            ->add('duration')
            ->add('impactSocietal')
            ->add('impactEnvironmental')
            ->add('userMin')
            ->add('userMax')
            ->add('bonus')
            ->add('adress')
            ->add('latitude')
            ->add('longitude')
            ->add('author')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
